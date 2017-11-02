//
//  GHProject.swift
//  GithubSDKPackageDescription
//
//  Created by Evgeny Kalashnikov on 02.11.2017.
//
import Foundation

public class GHProject: GHObject {
    public fileprivate(set) var cursor: String
    public fileprivate(set) var id: String
    public fileprivate(set) var name: String
    public fileprivate(set) var body: String?
    public fileprivate(set) var totalCount: Int
    public fileprivate(set) var columnsCount: Int
    
    public init(cursor: String, id: String, name: String, body: String?, totalCount: Int, columnsCount: Int) {
        self.cursor = cursor
        self.id = id
        self.name = name
        self.body = body
        self.totalCount = totalCount
        self.columnsCount = columnsCount
        super.init()
    }
    
    convenience init?(project: RepositoriesQuery.Data.Repository.Repository.Repository.Repository.Project.Edge, totalCount: Int) {
        if let node = project.node {
            self.init(cursor: project.cursor,
                      id: node.id,
                      name: node.name,
                      body: nil,
                      totalCount: totalCount,
                      columnsCount: node.columnsCount.totalCount
            )
            return
        }
        return nil
    }
}
