//  This file was automatically generated and should not be edited.

import Apollo

public final class RepositoriesQuery: GraphQLQuery {
  public static let operationString =
    "query repositories($first: Int!, $after: String) {\n  repositories: viewer {\n    __typename\n    repositories(first: $first, after: $after) {\n      __typename\n      totalCount\n      repositories: edges {\n        __typename\n        cursor\n        repository: node {\n          __typename\n          name\n          id\n          url\n          projectsCount: projects {\n            __typename\n            totalCount\n          }\n          issuesCount: issues {\n            __typename\n            totalCount\n          }\n          labelsCount: labels {\n            __typename\n            totalCount\n          }\n          pullRequestsCount: pullRequests {\n            __typename\n            totalCount\n          }\n        }\n      }\n    }\n  }\n}"

  public var first: Int
  public var after: String?

  public init(first: Int, after: String? = nil) {
    self.first = first
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", alias: "repositories", type: .nonNull(.object(Repository.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repositories: Repository) {
      self.init(snapshot: ["__typename": "Query", "repositories": repositories.snapshot])
    }

    /// The currently authenticated user.
    public var repositories: Repository {
      get {
        return Repository(snapshot: snapshot["repositories"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "repositories")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositories", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("after")], type: .nonNull(.object(Repository.selections))),
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
          GraphQLField("edges", alias: "repositories", type: .list(.object(Repository.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, repositories: [Repository?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount, "repositories": repositories.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
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
        public var repositories: [Repository?]? {
          get {
            return (snapshot["repositories"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Repository(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "repositories")
          }
        }

        public struct Repository: GraphQLSelectionSet {
          public static let possibleTypes = ["RepositoryEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "repository", type: .object(Repository.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(cursor: String, repository: Repository? = nil) {
            self.init(snapshot: ["__typename": "RepositoryEdge", "cursor": cursor, "repository": repository.flatMap { $0.snapshot }])
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
          public var repository: Repository? {
            get {
              return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "repository")
            }
          }

          public struct Repository: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("projects", alias: "projectsCount", type: .nonNull(.object(ProjectsCount.selections))),
              GraphQLField("issues", alias: "issuesCount", type: .nonNull(.object(IssuesCount.selections))),
              GraphQLField("labels", alias: "labelsCount", type: .object(LabelsCount.selections)),
              GraphQLField("pullRequests", alias: "pullRequestsCount", type: .nonNull(.object(PullRequestsCount.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, id: GraphQLID, url: String, projectsCount: ProjectsCount, issuesCount: IssuesCount, labelsCount: LabelsCount? = nil, pullRequestsCount: PullRequestsCount) {
              self.init(snapshot: ["__typename": "Repository", "name": name, "id": id, "url": url, "projectsCount": projectsCount.snapshot, "issuesCount": issuesCount.snapshot, "labelsCount": labelsCount.flatMap { $0.snapshot }, "pullRequestsCount": pullRequestsCount.snapshot])
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
            public var projectsCount: ProjectsCount {
              get {
                return ProjectsCount(snapshot: snapshot["projectsCount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "projectsCount")
              }
            }

            /// A list of issues that have been opened in the repository.
            public var issuesCount: IssuesCount {
              get {
                return IssuesCount(snapshot: snapshot["issuesCount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "issuesCount")
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

            /// A list of pull requests that have been opened in the repository.
            public var pullRequestsCount: PullRequestsCount {
              get {
                return PullRequestsCount(snapshot: snapshot["pullRequestsCount"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "pullRequestsCount")
              }
            }

            public struct ProjectsCount: GraphQLSelectionSet {
              public static let possibleTypes = ["ProjectConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "ProjectConnection", "totalCount": totalCount])
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

            public struct IssuesCount: GraphQLSelectionSet {
              public static let possibleTypes = ["IssueConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "IssueConnection", "totalCount": totalCount])
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

            public struct PullRequestsCount: GraphQLSelectionSet {
              public static let possibleTypes = ["PullRequestConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "PullRequestConnection", "totalCount": totalCount])
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