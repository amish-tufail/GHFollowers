//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Amish on 28/10/2024.
//

import UIKit

class FollowerListVC: UIViewController {
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!.rawValue, actionTitle: "Ok")
                return
            }
            
            print("Followers Count: \(followers.count)")
            print("Followers:")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
