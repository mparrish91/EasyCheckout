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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in

            dispatch_async(dispatch_get_main_queue(), {

                let nav = UINavigationController()

                self.items = data
                //create my selectionViewControllers
                for item in data {
                    if let selectionVC = ECSelectionViewController(item: item) {
                        self.vcArray.append(selectionVC)
                    }
                }

                nav.viewControllers = [self.vcArray[0]]
                NSNotificationCenter.defaultCenter().postNotificationName("dataLoaded", object: nil)


                self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
                self.window?.rootViewController = nav
                self.window?.makeKeyAndVisible()
            })
        }

        return true
    }


}

