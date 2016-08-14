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
    var keptItemIDs = [String]()
    var keptItemsArray = [ECItem]()


func fetchCurrentFix(completionHandler: (data: [ECItem], error: NSError?) -> Void) -> Void {

    let newURL = NSURL(string:"https://fake-mobile-backend.herokuapp.com/api/current_fix")

    if let requestUrl = newURL {

        let getRequest = ECRequest(requestMethod: "GET", url: requestUrl, params: [:])

        getRequest.performRequestWithHandler(
            { (success: Bool, object: AnyObject?) -> Void in

                var objectArray = [ECItem]()

                if success {
                    if let itemArray = object?["shipment_items"] as? [[String:AnyObject]]{
                        for dic in itemArray {
                            let newResponseObject = ECItem(dictionary: dic)
                            objectArray.append(newResponseObject)
                        }
                        if itemArray.isEmpty == false {
                            completionHandler(data: objectArray, error: nil)
                        }
                    }else {
                        print("error retrieving fix")
                    }
                }else {
                    print("error performing request")
                    NSNotificationCenter.defaultCenter().postNotificationName("badRequest", object: nil)
                }
        })
    }
    }
    
    



func updateCurrentFix(keptItemsArray: [String], completionHandler: (data: ECInvoice, error: NSError?) -> Void) -> Void {


    let newURL = NSURL(string:"https://fake-mobile-backend.herokuapp.com/api/current_fix")

    let params = ["keep" : keptItemsArray]

    if let requestUrl = newURL {

        let putRequest = ECRequest(requestMethod: "PUT", url: requestUrl, params: params)

        putRequest.performRequestWithHandler(
            { (success: Bool, object: AnyObject?) -> Void in

                var newResponseObject: ECInvoice


                if success {
                    if let dic = object as? [String:AnyObject]{
                        newResponseObject = ECInvoice(dictionary: dic)

                        if dic.isEmpty == false {
                            completionHandler(data: newResponseObject, error: nil)
                        }

                    }else {
                        print("error retrieving fix")

                    }
                }else {
                    print("error performing request")
//                    NSNotificationCenter.defaultCenter().postNotificationName("badRequest", object: nil)

                }
                
        })
    }
    
    }

}








