import Foundation
import Apollo

public class GithubSDK: NSObject {
    static var graphqlURL = "https://api.github.com/graphql"
    var apollo : ApolloClient?
    
    public struct Oauth {
        var clientId: String
        var clientSecret: String
        /// must be the same as in oauth app on github, it's important
        var redirectUri: String
        var scopes: [String]
        
        public init(clientId: String, clientSecret: String, redirectUri: String, scopes: [String]) {
            self.clientId = clientId
            self.clientSecret = clientSecret
            self.redirectUri = redirectUri
            self.scopes = scopes
        }
        
        public func authorizeURL() -> URL? {
            var url = "https://github.com/login/oauth/authorize?allow_signup=false"
            url += "&client_id=" + self.clientId
            url += "&scope=" + self.scopes.joined(separator: ",")
            return URL(string: url)
        }
        
        public func code(from url: URL?) -> String? {
            return url?.URLParameters["code"]
        }
        
        public func accessTokenRequest(code: String) -> URLRequest? {
            if let url = self.accessTokenURL(), let data = self.accessTokenFormData(code: code) {
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
                request.httpBody = data
                return request
            }
            return nil
        }
        
        func accessTokenURL() -> URL? {
            return URL(string: "https://github.com/login/oauth/access_token")
        }
        
        func accessTokenFormData(code: String) -> Data? {
            var data = "client_id=" + self.clientId
            data += "&client_secret=" + self.clientSecret
            data += "&code=" + code
            return data.data(using: .utf8)
        }
    }
    
    @discardableResult
    public func setup(accessToken: String) -> ApolloClient? {
        if let url =  URL(string: GithubSDK.graphqlURL) {
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = ["Authorization": "bearer \(accessToken)"]
            self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
            return self.apollo
        }
        return nil
    }
    
    /// this func give user information.
    /// GraphQL file is user_info.graphql
    @discardableResult
    public func usersInfo(complition: @escaping (_ user: GHUser?,_ error: Error?)->()) -> Cancellable? {
        if let apollo = self.apollo {
            let query =  UsersInfoQuery()
            
            return apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main) { (result, error) in
                if let data = result?.data?.userInfo {
                    let user = GHUser(userInfo: data)
                    complition(user, nil)
                } else if let error = error {
                    complition(nil, error)
                } else {
                    complition(nil, NSError(domain: "unnown error userInfo", code: -1, userInfo: nil) as Error)
                }
            }
        }
        return nil
    }
    
    @discardableResult
    public func userRepositories(first: Int = 10, after: String? = nil, firstProjects: Int = 0, firstIssues: Int = 0, firstPullRequests: Int = 0, complition: @escaping (_ repositories: [GHRepository]?,_ error: Error?)->()) -> Cancellable? {
        if let apollo = self.apollo {
            let query = RepositoriesQuery(first: first, after: after, firstProjects: firstProjects, firstIssues: firstIssues, firstPullRequests: firstPullRequests)
            return apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main) { (result, error) in
                if let repositories = result?.data?.user.repositories {
                    var result = [GHRepository]()
                    let totalCount = repositories.totalCount
                    repositories.edges?.forEach({ (edge) in
                        if let edge = edge, let r = GHRepository(repository: edge, totalCount: totalCount) {
                            result.append(r)
                        }
                    })
                    complition(result, nil)
                } else if let error = error {
                    complition(nil, error)
                } else {
                    complition(nil, NSError(domain: "unnown error userInfo", code: -1, userInfo: nil) as Error)
                }
            }
        }
        return nil
    }
    
    public class func handleAccessTokenURL(url: URL, oauth: Oauth, result: @escaping (_ accessToken: String?, _ error: Error?)->()) {
        if url.absoluteString.range(of: oauth.redirectUri) != nil {
            if let code = oauth.code(from: url), let request = oauth.accessTokenRequest(code: code) {
                let configuration = URLSessionConfiguration.default
                let session = URLSession(configuration: configuration)
                session.dataTask(with: request, completionHandler: { (data, response, error) in
                    let error = error ?? NSError(domain: "GithubSDK.handleAccessTokenURL - unnown error", code: -1, userInfo: nil)
                    if let response = response as? HTTPURLResponse {
                        if response.statusCode == 200 {
                            if let data = data, let string = String(data: data, encoding: .utf8) {
                                let accessToken = self.accessTokenFromResponse(string)
                                if let accessToken = accessToken {
                                    result(accessToken, nil)
                                    return
                                }
                            }
                        }
                    }
                    result(nil, error)
                }).resume()
            }
        }
    }
    
}

private extension GithubSDK {
    
    class func accessTokenFromResponse(_ response: String) -> String? {
        let accessTokenParam = response.components(separatedBy: "&").first
        if let accessTokenParam = accessTokenParam {
            return accessTokenParam.components(separatedBy: "=").last
        }
        return nil
    }
}

