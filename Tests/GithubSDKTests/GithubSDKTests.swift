import XCTest
@testable import GithubSDK

class GithubSDKTests: XCTestCase {
    
    func testLogin() {
        let oauth = GithubSDK.Oauth(clientId: "edb3dc69829c9ff3c548", clientSecret: "ecfc85304bd344d09fd81e693dbfdb5860c932bf", redirectUri: "https://github_projects", scopes: ["user","repo"])
        let url = oauth.authorizeURL()
        let correctAuthorizeURL = "https://github.com/login/oauth/authorize?allow_signup=false&client_id=edb3dc69829c9ff3c548&scope=user,repo"
        XCTAssertEqual(url?.absoluteString, correctAuthorizeURL)
        
        let codeUrl = URL(string: "https://github_projects?code=123")
        let code = oauth.code(from: codeUrl)
        XCTAssertEqual(code, "123")
        
        let correctAccessTokenURL = "https://github.com/login/oauth/access_token"
        let body = oauth.accessTokenFormData(code: code!)
        let request = oauth.accessTokenRequest(code: code!)
        XCTAssertEqual(request?.url?.absoluteString, correctAccessTokenURL)
        XCTAssertEqual(request?.httpBody, body)
    }

    static var allTests = [
        ("testLogin", testLogin),
    ]
}
