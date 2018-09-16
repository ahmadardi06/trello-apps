//
//  SectionCell.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class SectionCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var labelSection: UILabel = {
        let lbl = UILabel()
        lbl.text = "Home"
        return lbl
    }()
    
    var labelSection1: UILabel = {
        let lbl = UILabel()
        lbl.text = "Home"
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        collectionView.register(ViewCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.backgroundColor = UIColor.blue
        collectionView.backgroundColor = UIColor.white
        
        addSubview(labelSection)
        addSubview(collectionView)
        addSubview(labelSection1)
        
        addConstraintWithFormat(format: "H:|-[v0]-|", views: labelSection)
        addConstraintWithFormat(format: "V:|-[v0]-10-[v1(300)]-10-[v2]", views: labelSection, collectionView, labelSection1)
        addConstraintWithFormat(format: "H:|-[v0]-|", views: collectionView)
        addConstraintWithFormat(format: "H:|-[v0]-|", views: labelSection1)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ViewCell
        let color = [UIColor.red, UIColor.black, UIColor.brown, UIColor.magenta, UIColor.green, UIColor.cyan, UIColor.gray, UIColor.orange, UIColor.purple, UIColor.yellow]
        cell.backgroundColor = color[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        let yourHeight = yourWidth
//        print("width: \(yourWidth)")
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click: \(indexPath.item)")
    }
    
}
