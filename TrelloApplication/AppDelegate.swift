//
//  AppDelegate.swift
//  TrelloApplication
//
//  Created by carsworld Indonesia on 16/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        navController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        window?.rootViewController = navController
        
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 0, green: 140, blue: 200)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        application.statusBarStyle = .lightContent
        
        let statusBarOnTop = UIView()
        statusBarOnTop.backgroundColor = UIColor.rgb(red: 0, green: 121, blue: 191)
        
        window?.addSubview(statusBarOnTop)
        window?.addConstraintWithFormat(format: "H:|[v0]|", views: statusBarOnTop)
        window?.addConstraintWithFormat(format: "V:|[v0(20)]|", views: statusBarOnTop)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

