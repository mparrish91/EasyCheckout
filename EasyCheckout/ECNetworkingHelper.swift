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

    let newURL = NSURL(string:"https://fakemobile-backend.herokuapp.com/")

    if let requestUrl = newURL {

        let getRequest = ECRequest(requestMethod: "GET", url: requestUrl)

        getRequest.performRequestWithHandler(
            { (success: Bool, object: AnyObject?) -> Void in

                var objectArray = [ECInvoice]()

                if success {
                    if let dataSource = object?["query"] as? [String:AnyObject], forecastArray = dataSource["results"]?["channel"]??["item"]??["forecast"] as? [[String:AnyObject]] {

                        for dic in forecastArray {
//                            let newResponseObject = WMWeatherResponseObject(dictionary: dic)
//                            objectArray.append(newResponseObject)

                        }

                        if dataSource.isEmpty == false {
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




