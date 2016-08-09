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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//        ECNetworkingHelper.sharedInstance.fetchCurrentFix { (data, error) in
//
//            dispatch_async(dispatch_get_main_queue(), {
//
//                let nav = UINavigationController()
//
//
//                //create my selectionViewControllers
//                for item in data {
//                    if let selectionVC = ECSelectionViewController(item: item) {
//                        self.vcArray.append(selectionVC)
//                    }
//                }
//
//                nav.viewControllers = [self.vcArray[0]]
//
//                self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//                self.window?.rootViewController = nav
//                self.window?.makeKeyAndVisible()
//            })
//        }


        ECNetworkingHelper.sharedInstance.updateCurrentFix(["28008527", "28008523"], completionHandler: { (data, error) in

            print(data)
            print(error)
            
        })
        
        return true
    }


}

