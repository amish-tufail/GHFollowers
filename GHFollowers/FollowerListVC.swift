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
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.title = userName
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
