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
                if let selectionVC = ECSelectionViewController(items: data) {
                    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
                    self.window?.rootViewController = selectionVC
                    self.window?.makeKeyAndVisible()
                }
            })
        }
        return true
    }


}

