//  This file was automatically generated and should not be edited.

import Apollo

public final class RepositoriesQuery: GraphQLQuery {
  public static let operationString =
    "query repositories($first: Int!, $after: String, $firstProjects: Int!, $firstIssues: Int!, $firstPullRequests: Int!) {\n  user: viewer {\n    __typename\n    repositories: repositories(first: $first, after: $after) {\n      __typename\n      totalCount\n      edges {\n        __typename\n        cursor\n        node {\n          __typename\n          name\n          id\n          url\n          projects: projects(first: $firstProjects) {\n            __typename\n            totalCount\n            edges {\n              __typename\n              cursor\n              node {\n                __typename\n                id\n                name\n                columnsCount: columns {\n                  __typename\n                  totalCount\n                }\n              }\n            }\n          }\n          issuesOpened: issues(first: $firstIssues, states: OPEN) {\n            __typename\n            totalCount\n            edges {\n              __typename\n              cursor\n              node {\n                __typename\n                id\n                title\n                createdAt\n                labelsCount: labels {\n                  __typename\n                  totalCount\n                }\n              }\n            }\n          }\n          pullRequestsOpened: pullRequests(first: $firstPullRequests, states: OPEN) {\n            __typename\n            totalCount\n            edges {\n              __typename\n              cursor\n              node {\n                __typename\n                id\n                title\n                createdAt\n                labelsCount: labels {\n                  __typename\n                  totalCount\n                }\n              }\n            }\n          }\n          labelsCount: labels {\n            __typename\n            totalCount\n          }\n        }\n      }\n    }\n  }\n}"

  public var first: Int
  public var after: String?
  public var firstProjects: Int
  public var firstIssues: Int
  public var firstPullRequests: Int

  public init(first: Int, after: String? = nil, firstProjects: Int, firstIssues: Int, firstPullRequests: Int) {
    self.first = first
    self.after = after
    self.firstProjects = firstProjects
    self.firstIssues = firstIssues
    self.firstPullRequests = firstPullRequests
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after, "firstProjects": firstProjects, "firstIssues": firstIssues, "firstPullRequests": firstPullRequests]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", alias: "user", type: .nonNull(.object(User.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User) {
      self.init(snapshot: ["__typename": "Query", "user": user.snapshot])
    }

    /// The currently authenticated user.
    public var user: User {
      get {
        return User(snapshot: snapshot["user"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositories", alias: "repositories", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("after")], type: .nonNull(.object(Repository.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(repositories: Repository) {
        self.init(snapshot: ["__typename": "User", "repositories": repositories.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(snapshot: snapshot["repositories"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, edges: [Edge?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return snapshot["totalCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["RepositoryEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(cursor: String, node: Node? = nil) {
            self.init(snapshot: ["__typename": "RepositoryEdge", "cursor": cursor, "node": node.flatMap { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A cursor for use in pagination.
          public var cursor: String {
            get {
              return snapshot["cursor"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "cursor")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("projects", alias: "projects", arguments: ["first": GraphQLVariable("firstProjects")], type: .nonNull(.object(Project.selections))),
              GraphQLField("issues", alias: "issuesOpened", arguments: ["first": GraphQLVariable("firstIssues"), "states": "OPEN"], type: .nonNull(.object(IssuesOpened.selections))),
              GraphQLField("pullRequests", alias: "pullRequestsOpened", arguments: ["first": GraphQLVariable("firstPullRequests"), "states": "OPEN"], type: .nonNull(.object(PullRequestsOpened.selections))),
              GraphQLField("labels", alias: "labelsCount", type: .object(LabelsCount.selections)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, id: GraphQLID, url: String, projects: Project, issuesOpened: IssuesOpened, pullRequestsOpened: PullRequestsOpened, labelsCount: LabelsCount? = nil) {
              self.init(snapshot: ["__typename": "Repository", "name": name, "id": id, "url": url, "projects": projects.snapshot, "issuesOpened": issuesOpened.snapshot, "pullRequestsOpened": pullRequestsOpened.snapshot, "labelsCount": labelsCount.flatMap { $0.snapshot }])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            /// The HTTP URL for this repository
            public var url: String {
              get {
                return snapshot["url"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }

            /// A list of projects under the owner.
            public var projects: Project {
              get {
                return Project(snapshot: snapshot["projects"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "projects")
              }
            }

            /// A list of issues that have been opened in the repository.
            public var issuesOpened: IssuesOpened {
              get {
                return IssuesOpened(snapshot: snapshot["issuesOpened"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "issuesOpened")
              }
            }

            /// A list of pull requests that have been opened in the repository.
            public var pullRequestsOpened: PullRequestsOpened {
              get {
                return PullRequestsOpened(snapshot: snapshot["pullRequestsOpened"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "pullRequestsOpened")
              }
            }

            /// A list of labels associated with the repository.
            public var labelsCount: LabelsCount? {
              get {
                return (snapshot["labelsCount"] as? Snapshot).flatMap { LabelsCount(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "labelsCount")
              }
            }

            public struct Project: GraphQLSelectionSet {
              public static let possibleTypes = ["ProjectConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int, edges: [Edge?]? = nil) {
                self.init(snapshot: ["__typename": "ProjectConnection", "totalCount": totalCount, "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
                }
                set {
                  snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["ProjectEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(cursor: String, node: Node? = nil) {
                  self.init(snapshot: ["__typename": "ProjectEdge", "cursor": cursor, "node": node.flatMap { $0.snapshot }])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A cursor for use in pagination.
                public var cursor: String {
                  get {
                    return snapshot["cursor"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "cursor")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["Project"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    GraphQLField("columns", alias: "columnsCount", type: .nonNull(.object(ColumnsCount.selections))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, name: String, columnsCount: ColumnsCount) {
                    self.init(snapshot: ["__typename": "Project", "id": id, "name": name, "columnsCount": columnsCount.snapshot])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  /// The project's name.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// List of columns in the project
                  public var columnsCount: ColumnsCount {
                    get {
                      return ColumnsCount(snapshot: snapshot["columnsCount"]! as! Snapshot)
                    }
                    set {
                      snapshot.updateValue(newValue.snapshot, forKey: "columnsCount")
                    }
                  }

                  public struct ColumnsCount: GraphQLSelectionSet {
                    public static let possibleTypes = ["ProjectColumnConnection"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(totalCount: Int) {
                      self.init(snapshot: ["__typename": "ProjectColumnConnection", "totalCount": totalCount])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the total count of items in the connection.
                    public var totalCount: Int {
                      get {
                        return snapshot["totalCount"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "totalCount")
                      }
                    }
                  }
                }
              }
            }

            public struct IssuesOpened: GraphQLSelectionSet {
              public static let possibleTypes = ["IssueConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int, edges: [Edge?]? = nil) {
                self.init(snapshot: ["__typename": "IssueConnection", "totalCount": totalCount, "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
                }
                set {
                  snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["IssueEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(cursor: String, node: Node? = nil) {
                  self.init(snapshot: ["__typename": "IssueEdge", "cursor": cursor, "node": node.flatMap { $0.snapshot }])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A cursor for use in pagination.
                public var cursor: String {
                  get {
                    return snapshot["cursor"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "cursor")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["Issue"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("title", type: .nonNull(.scalar(String.self))),
                    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                    GraphQLField("labels", alias: "labelsCount", type: .object(LabelsCount.selections)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, title: String, createdAt: String, labelsCount: LabelsCount? = nil) {
                    self.init(snapshot: ["__typename": "Issue", "id": id, "title": title, "createdAt": createdAt, "labelsCount": labelsCount.flatMap { $0.snapshot }])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  /// Identifies the issue title.
                  public var title: String {
                    get {
                      return snapshot["title"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the date and time when the object was created.
                  public var createdAt: String {
                    get {
                      return snapshot["createdAt"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "createdAt")
                    }
                  }

                  /// A list of labels associated with the object.
                  public var labelsCount: LabelsCount? {
                    get {
                      return (snapshot["labelsCount"] as? Snapshot).flatMap { LabelsCount(snapshot: $0) }
                    }
                    set {
                      snapshot.updateValue(newValue?.snapshot, forKey: "labelsCount")
                    }
                  }

                  public struct LabelsCount: GraphQLSelectionSet {
                    public static let possibleTypes = ["LabelConnection"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(totalCount: Int) {
                      self.init(snapshot: ["__typename": "LabelConnection", "totalCount": totalCount])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the total count of items in the connection.
                    public var totalCount: Int {
                      get {
                        return snapshot["totalCount"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "totalCount")
                      }
                    }
                  }
                }
              }
            }

            public struct PullRequestsOpened: GraphQLSelectionSet {
              public static let possibleTypes = ["PullRequestConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int, edges: [Edge?]? = nil) {
                self.init(snapshot: ["__typename": "PullRequestConnection", "totalCount": totalCount, "edges": edges.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (snapshot["edges"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Edge(snapshot: $0) } } }
                }
                set {
                  snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["PullRequestEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(cursor: String, node: Node? = nil) {
                  self.init(snapshot: ["__typename": "PullRequestEdge", "cursor": cursor, "node": node.flatMap { $0.snapshot }])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A cursor for use in pagination.
                public var cursor: String {
                  get {
                    return snapshot["cursor"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "cursor")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["PullRequest"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("title", type: .nonNull(.scalar(String.self))),
                    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                    GraphQLField("labels", alias: "labelsCount", type: .object(LabelsCount.selections)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(id: GraphQLID, title: String, createdAt: String, labelsCount: LabelsCount? = nil) {
                    self.init(snapshot: ["__typename": "PullRequest", "id": id, "title": title, "createdAt": createdAt, "labelsCount": labelsCount.flatMap { $0.snapshot }])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return snapshot["id"]! as! GraphQLID
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "id")
                    }
                  }

                  /// Identifies the pull request title.
                  public var title: String {
                    get {
                      return snapshot["title"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the date and time when the object was created.
                  public var createdAt: String {
                    get {
                      return snapshot["createdAt"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "createdAt")
                    }
                  }

                  /// A list of labels associated with the object.
                  public var labelsCount: LabelsCount? {
                    get {
                      return (snapshot["labelsCount"] as? Snapshot).flatMap { LabelsCount(snapshot: $0) }
                    }
                    set {
                      snapshot.updateValue(newValue?.snapshot, forKey: "labelsCount")
                    }
                  }

                  public struct LabelsCount: GraphQLSelectionSet {
                    public static let possibleTypes = ["LabelConnection"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(totalCount: Int) {
                      self.init(snapshot: ["__typename": "LabelConnection", "totalCount": totalCount])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the total count of items in the connection.
                    public var totalCount: Int {
                      get {
                        return snapshot["totalCount"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "totalCount")
                      }
                    }
                  }
                }
              }
            }

            public struct LabelsCount: GraphQLSelectionSet {
              public static let possibleTypes = ["LabelConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "LabelConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class UsersInfoQuery: GraphQLQuery {
  public static let operationString =
    "query usersInfo {\n  user_info: viewer {\n    __typename\n    name\n    email\n    bio\n    avatarUrl\n    id\n    location\n    login\n    url\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", alias: "user_info", type: .nonNull(.object(UserInfo.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(userInfo: UserInfo) {
      self.init(snapshot: ["__typename": "Query", "user_info": userInfo.snapshot])
    }

    /// The currently authenticated user.
    public var userInfo: UserInfo {
      get {
        return UserInfo(snapshot: snapshot["user_info"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user_info")
      }
    }

    public struct UserInfo: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, email: String, bio: String? = nil, avatarUrl: String, id: GraphQLID, location: String? = nil, login: String, url: String) {
        self.init(snapshot: ["__typename": "User", "name": name, "email": email, "bio": bio, "avatarUrl": avatarUrl, "id": id, "location": location, "login": login, "url": url])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The user's public profile name.
      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The user's publicly visible profile email.
      public var email: String {
        get {
          return snapshot["email"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      /// The user's public profile bio.
      public var bio: String? {
        get {
          return snapshot["bio"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "bio")
        }
      }

      /// A URL pointing to the user's public avatar.
      public var avatarUrl: String {
        get {
          return snapshot["avatarUrl"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "avatarUrl")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The user's public profile location.
      public var location: String? {
        get {
          return snapshot["location"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return snapshot["login"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login")
        }
      }

      /// The HTTP URL for this user
      public var url: String {
        get {
          return snapshot["url"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}