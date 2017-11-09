//
//  ViewController.swift
//  Demo
//
//  Created by Evgeny Kalashnikov on 21.10.2017.
//  Copyright © 2017 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import GithubSDK

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    let oauth = GithubSDK.Oauth(clientId: "edb3dc69829c9ff3c548", clientSecret: "ecfc85304bd344d09fd81e693dbfdb5860c932bf", redirectUri: "http://github_projects", scopes: ["user","repo"])
    let sdk = GithubSDK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = oauth.authorizeURL() {
            self.webView.loadRequest(URLRequest(url: url))
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func check(token: String) {
        print("token -", token)
        self.sdk.validateAccessToken(accessToken: token, oauth: self.oauth) { [weak self] (isValid) in
            print("isValid", isValid)
            self?.sdk.setup(accessToken: token)
            self?.doIt()
        }
    }
    
    func doIt() {
        self.sdk.usersInfo(complition: { (user, error) in
            print("usersInfo", user ?? "no user info")
        })
        
        self.sdk.userRepositories(first: 1, after: "Y3Vyc29yOnYyOpHOBiYSYg==", firstProjects: 3, firstIssues: 3, firstPullRequests: 3, complition: { (reposetiries, error) in
            if let reps = reposetiries {
                reps.forEach({ (rep) in
                    print(rep)
                })
            }
        })
    }
}

extension ViewController : UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let url = request.url {
            GithubSDK.handleAccessTokenURL(url: url, oauth: self.oauth, result: { [weak self] (token, error) in
                if let token = token {
                    self?.check(token: token)
                } else {
                    print("error",error ?? "Unnown error")
                }
            })
        }
        return true
    }
    
    
}
