//
//  GHIssue.swift
//  GithubSDK
//
//  Created by Evgeny Kalashnikov on 02.11.2017.
//
import Foundation

public class GHIssue: GHObject {
    public fileprivate(set) var cursor: String
    public fileprivate(set) var id: String
    public fileprivate(set) var title: String
    public fileprivate(set) var createdAt: Date?
    public fileprivate(set) var labelsCount: Int = 0
    public fileprivate(set) var totalCount: Int
    
    public init(cursor: String, id: String, title: String, createdAt: Date?, labelsCount: Int = 0, totalCount: Int) {
        self.cursor = cursor
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.labelsCount = labelsCount
        self.totalCount = totalCount
        super.init()
    }
    
    convenience init?(issue: RepositoriesQuery.Data.User.Repository.Edge.Node.IssuesOpened.Edge, totalCount: Int) {
        if let node = issue.node {
            let createdAtDate = GHObject.date(from: node.createdAt)
            self.init(cursor: issue.cursor,
                      id: node.id,
                      title: node.title,
                      createdAt: createdAtDate,
                      labelsCount: node.labelsCount?.totalCount ?? 0,
                      totalCount: totalCount
            )
            return
        }
        return nil
    }
}
