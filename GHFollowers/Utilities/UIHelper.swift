//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Amish on 13/11/2024.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12.0
        let itemSpacing: CGFloat = 12.0
        let availableWidth = width - (padding * 2) - (itemSpacing * 2)
        let itemWidth = availableWidth / 3.0
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40.0)
        
        return flowLayout
    }
}
