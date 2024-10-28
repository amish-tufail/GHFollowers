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
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48.0),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            searchTextField.heightAnchor.constraint(equalToConstant: 50.0)
        ])
            
    }
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
