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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in

            dispatch_async(dispatch_get_main_queue(), {

                let nav = UINavigationController()

                //create my selectionViewControllers
                for item in data {
                    if let selectionVC = ECSelectionViewController(item: item) {
                        nav.viewControllers.append(selectionVC)
                    }
                }

                self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
                self.window?.rootViewController = nav
                self.window?.makeKeyAndVisible()
            })
        }
        return true
    }


}

