//
//  GHUser.swift
//  GithubSDK
//
//  Created by Evgeny Kalashnikov on 24.10.2017.
//
import Foundation

public class GHUser: NSObject {
    public fileprivate(set) var id: String
    public fileprivate(set) var login: String
    public fileprivate(set) var name: String?
    public fileprivate(set) var url: URL?
    public fileprivate(set) var email: String
    public fileprivate(set) var bio: String?
    public fileprivate(set) var avatarUrl: URL?
    public fileprivate(set) var location: String?
    
    public init(id: String, login: String, name: String?, url: URL?, email: String, bio: String?, avatarUrl: URL?, location: String?) {
        self.id = id
        self.login = login
        self.name = name
        self.url = url
        self.email = email
        self.bio = bio
        self.avatarUrl = avatarUrl
        self.location = location
        super.init()
    }
    
    convenience init(userInfo: UsersInfoQuery.Data.UserInfo) {
        let url = URL(string: userInfo.url)
        let avatarUrl = URL(string: userInfo.avatarUrl)
        self.init(id: userInfo.id,
                  login: userInfo.login,
                  name: userInfo.name,
                  url: url,
                  email: userInfo.email,
                  bio: userInfo.bio,
                  avatarUrl: avatarUrl,
                  location: userInfo.location
        )
    }
    
    public override var description: String {
        get {
            var result = "\(self.classForCoder)\n"
            Mirror(reflecting: self).children.forEach { (value) in
                if let label = value.label {
                    result += "\(label) - \(value.value)\n"
                }
            }
            return result
        }
    }
}
