//
//  Repository.swift
//  GithubSDKPackageDescription
//
//  Created by Evgeny Kalashnikov on 24.10.2017.
//
import Foundation

public class GHRepository: NSObject {
    public fileprivate(set) var totalCount: Int
    public fileprivate(set) var cursor: String
    public fileprivate(set) var id: String
    public fileprivate(set) var name: String
    public fileprivate(set) var projectsCount: Int
    public fileprivate(set) var issuesCount: Int
    public fileprivate(set) var labelsCount: Int?
    public fileprivate(set) var pullRequestsCount: Int
    public fileprivate(set) var url: URL?
    public fileprivate(set) weak var owner: GHUser?
    
    public init(totalCount: Int, cursor: String, id: String, name: String, projectsCount: Int, issuesCount: Int, labelsCount: Int?, pullRequestsCount: Int, url: URL?, owner: GHUser?) {
        self.totalCount = totalCount
        self.cursor = cursor
        self.id = id
        self.name = name
        self.projectsCount = projectsCount
        self.issuesCount = issuesCount
        self.labelsCount = labelsCount
        self.pullRequestsCount = pullRequestsCount
        self.url = url
        self.owner = owner
        super.init()
    }
    
    convenience init?(repository: RepositoriesQuery.Data.Repository.Repository.Repository, totalCount: Int) {
        if let rep = repository.repository {
            let url = URL(string: rep.url)
            self.init(totalCount: totalCount, cursor: repository.cursor, id: rep.id, name: rep.name, projectsCount: rep.projectsCount.totalCount, issuesCount: rep.issuesCount.totalCount, labelsCount: rep.labelsCount?.totalCount, pullRequestsCount: rep.pullRequestsCount.totalCount, url: url, owner: nil)
        }
        return nil
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
