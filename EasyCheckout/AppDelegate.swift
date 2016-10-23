//
//  AppDelegate.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    var nextVCIndex = 1
    var vcArray = [ECSelectionViewController]()
    var items = [ECItem]()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Show Loading Indicator
        let nav = ECNavigationController()
        let loadingVC = ECLoadingViewController()
        nav.viewControllers = [loadingVC]

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()



        return true
    }

    
    

}

