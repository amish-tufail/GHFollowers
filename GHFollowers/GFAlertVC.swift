//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Amish on 29/10/2024.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = GFAlertContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20.0)
    let bodyLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")

    var alertTitle: String?
    var alertBody: String?
    var alertAction: String?
    
    init(alertTitle: String, alertBody: String, alertAction: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.alertAction = alertAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.75)
        configure()
    }

    private func configure() {
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    @objc private func actionButtonTapped() {
        dismiss(animated: true)
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220.0),
            containerView.widthAnchor.constraint(equalToConstant: 280.0),
        ])
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 28.0),
        ])
    }
    
    
    private func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(alertAction ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20.0),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.0),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20.0),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0),
        ])
    }
    
    private func configureBodyLabel() {
        containerView.addSubview(bodyLabel)
        bodyLabel.text = alertBody ?? "Unable to complete the request."
        bodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.0),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20.0),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12.0)
        ])
    }
    
}
