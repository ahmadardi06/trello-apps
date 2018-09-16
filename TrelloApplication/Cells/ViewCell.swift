//
//  ViewCell.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class ViewCell: BaseCell {
    
//    let imgIcon: UIImageView = {
//        let img = UIImageView()
//        img.backgroundColor = UIColor.orange
//        return img
//    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.orange
        
//        addSubview(imgIcon)
//
//        addConstraintWithFormat(format: "H:[v0(20)]", views: imgIcon)
//        addConstraintWithFormat(format: "V:[v0(20)]", views: imgIcon)
    }
}
