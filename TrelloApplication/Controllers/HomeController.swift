//
//  ViewController.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let menuLabel = ["Trello","Boards","Search","Notifications","Account"]
    
    lazy var menuBottom: MenuBottomViews = {
        let mb = MenuBottomViews()
        mb.homeController = self
        return mb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBarTop()
        setupMenuBarBottom()
        setupViewCollection()
        
    }
    
    @objc func setupViewCollection() {
        collectionView?.backgroundColor = UIColor.white
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        collectionView?.register(SectionCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
        
    }

    @objc func setupMenuBarTop() {
        navigationController?.navigationBar.isTranslucent = false
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        titleView.text = "Trello"
        titleView.textColor = UIColor.white
        titleView.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleView
    
        let iconPlus = UIImage(named: "add-16")?.withRenderingMode(.alwaysOriginal)
        let iconPlusBar = UIBarButtonItem(image: iconPlus, style: .plain, target: self, action: #selector(self.handleButtonAdd))
        navigationItem.rightBarButtonItem = iconPlusBar
    }
    
    @objc func handleButtonAdd() {
        print("Under Construction !")
    }
    
    @objc func setupMenuBarBottom() {
        
        view.addSubview(menuBottom)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBottom)
        view.addConstraintWithFormat(format: "V:|-[v0(50)]-0-|", views: menuBottom)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SectionCell
        cell.labelSection.text = menuLabel[indexPath.item]
        cell.labelSection1.text = menuLabel[indexPath.item]
//        let color = [UIColor.gray, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.red]
//        cell.backgroundColor = color[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let hasilBagi = targetContentOffset.pointee.x / view.frame.width
        setTitleNavbar(menuIndex: Int(hasilBagi))
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let getValueX = scrollView.contentOffset.x
        menuBottom.awalHorizontalView?.constant = getValueX / 5
    }
    
    @objc func scrollToViewIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    @objc func setTitleNavbar(menuIndex: Int) {
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        titleView.text = menuLabel[menuIndex]
        titleView.textColor = UIColor.white
        titleView.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleView
    }
}

