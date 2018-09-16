//
//  MenuBottom.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class MenuBottomViews: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let viewHeight: CGFloat = 50
    let menuList = ["Home", "Boards", "Search", "Notofications", "Account"]
    let menuIcon = ["home-16","board-16","magnifying-16","notification-16","profile-16"]
    var awalHorizontalView: NSLayoutConstraint?
    
    var homeController: HomeController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 0, green: 140, blue: 200)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuBottomCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        
        setupHorizontalBar()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBottomCell
        
        cell.iconImage.image = UIImage(named: menuIcon[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.scrollToViewIndex(menuIndex: indexPath.item)
        homeController?.setTitleNavbar(menuIndex: indexPath.item)
    }
    
    @objc func setupHorizontalBar() {
        let horizontalView = UIView()
        horizontalView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalView)
        
        awalHorizontalView = horizontalView.leftAnchor.constraint(equalTo: self.leftAnchor)
        awalHorizontalView?.isActive = true
        
        horizontalView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/5).isActive = true
        horizontalView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
