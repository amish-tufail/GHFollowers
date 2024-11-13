//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Amish on 08/11/2024.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseIdentifier = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        userNameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12.0),
            userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20.0)
        ])
    }
}
