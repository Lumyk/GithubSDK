//
//  Repository.swift
//  GithubSDKPackageDescription
//
//  Created by Evgeny Kalashnikov on 24.10.2017.
//
import Foundation

public class GHRepository: GHObject {
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
    public fileprivate(set) var projects: [GHProject]?
    public fileprivate(set) var issues: [GHIssue]?
    public fileprivate(set) var pullRequests: [GHPullRequest]?
    
    public init(totalCount: Int, cursor: String, id: String, name: String, projectsCount: Int, issuesCount: Int, labelsCount: Int?, pullRequestsCount: Int, url: URL?, owner: GHUser?, projects: [GHProject]?, issues: [GHIssue]?, pullRequests: [GHPullRequest]?) {
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
        self.projects = projects
        self.issues = issues
        self.pullRequests = pullRequests
        super.init()
    }
    
    convenience init?(repository: RepositoriesQuery.Data.Repository.Repository.Repository, totalCount: Int) {
        if let rep = repository.repository {
            let url = URL(string: rep.url)
            
            var projects : [GHProject]?
            rep.projects.edges?.forEach({ (edge) in
                if let edge = edge, let project = GHProject(project: edge, totalCount: rep.projects.totalCount) {
                    projects = projects ?? []
                    projects?.append(project)
                }
            })
            
            var issues : [GHIssue]?
            rep.issuesOpened.edges?.forEach({ (edge) in
                if let edge = edge, let issue = GHIssue(issue: edge, totalCount:  rep.issuesOpened.totalCount) {
                    issues = issues ?? []
                    issues?.append(issue)
                }
            })
            
            var pullRequests: [GHPullRequest]?
            rep.pullRequestsOpened.edges?.forEach({ (edge) in
                if let edge = edge, let pullRequest = GHPullRequest(pullRequest: edge, totalCount:  rep.issuesOpened.totalCount) {
                    pullRequests = pullRequests ?? []
                    pullRequests?.append(pullRequest)
                }
            })
            
            self.init(totalCount: totalCount,
                      cursor: repository.cursor,
                      id: rep.id,
                      name: rep.name,
                      projectsCount: rep.projects.totalCount,
                      issuesCount: rep.issuesOpened.totalCount,
                      labelsCount: rep.labelsCount?.totalCount,
                      pullRequestsCount: rep.pullRequestsOpened.totalCount,
                      url: url,
                      owner: nil,
                      projects: projects,
                      issues: issues,
                      pullRequests: pullRequests
            )
            return
        }
        return nil
    }
}
