//
//  ECNetworkingHelper.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import Foundation


final class ECNetworkingHelper: NSObject {
    static let sharedInstance = ECNetworkingHelper()

func fetchCurrentFix(completionHandler: (data: [ECItem], error: NSError?) -> Void) -> Void {

    let newURL = NSURL(string:"https://fake-mobile-backend.herokuapp.com/api/current_fix")

    if let requestUrl = newURL {

        let getRequest = ECRequest(requestMethod: "GET", url: requestUrl)

        getRequest.performRequestWithHandler(
            { (success: Bool, object: AnyObject?) -> Void in

                var objectArray = [ECInvoice]()

                if success {
                    if let itemArray = object?["shipment_items"] as? [[String:AnyObject]]{

                        for dic in itemArray {
//                            let newResponseObject = WMWeatherResponseObject(dictionary: dic)
//                            objectArray.append(newResponseObject)

                        }

                        if itemArray.isEmpty == false {
//                            completionHandler(data: objectArray, error: nil)
                        }
                    }else if let dataSource = object?["query"] as? [String:AnyObject] {
                        print("error retrieving forecasts ")

                        if dataSource["count"] as? Int == 0 {
                            //user entered bad city input
//                            NSNotificationCenter.defaultCenter().postNotificationName("badCity", object: nil)

                        }
                    }
                    else {
                        NSNotificationCenter.defaultCenter().postNotificationName("badRequest", object: nil)

                    }

                }else{
                    print("error performing request")
                }

        })
    }
    
    }




//
//func updateCurrentFix(keptItemsArray: [String], completionHandler: (data: [WMWeatherResponseObject], error: NSError?) -> Void) -> Void {
//
//}
//


}




