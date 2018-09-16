//
//  MenuCell.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class MenuBottomCell: BaseCell {
    
    let iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "profile-24")?.withRenderingMode(.alwaysOriginal)
        
        return icon
    }()
    
    let iconLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Home"
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(iconImage)
        addConstraintWithFormat(format: "H:[v0(20)]", views: iconImage)
        addConstraintWithFormat(format: "V:[v0(20)]", views: iconImage)
        
        addConstraint(NSLayoutConstraint(item: iconImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
