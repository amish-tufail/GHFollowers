//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Amish on 23/10/2024.
//

import UIKit

// RULE OF THUMB: Each object needs 4 constraints to where layout in view: X, Y, Width & Height. Traling & Bottom edges will have negative values

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let searchTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool {
        return !searchTextField.text!.isEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configure() {
        configureLogoImageView()
        configureSearchTextField()
        configureCallToActionButton()
        
        addTapGestureToView()
    }
    
    private func addTapGestureToView() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func pushToFollowersListVC() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for😄.", actionTitle: "Ok")
            print("No user name entered")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.userName = searchTextField.text
        followerListVC.title = searchTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(resource: .ghLogo)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 200.0),
        ])
    }
    
    private func configureSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48.0),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 50.0)
        ])
            
    }
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushToFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushToFollowersListVC()
        return true
    }
}
