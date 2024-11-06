//
//  GFButton.swift
//  GHFollowers
//
//  Created by Amish on 23/10/2024.
//

import UIKit

class GFButton: UIButton {

    // We override only when we do something custom
    override init(frame: CGRect) {
        super.init(frame: frame) // Default init -> Parent -> All Apple written
        // Then we do our custom one
        configure()
    }
    
    // This gets called when we init using storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10.0
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
