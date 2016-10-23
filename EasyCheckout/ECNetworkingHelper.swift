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
    var itemCount = 0



func fetchCurrentFix(_ completionHandler: @escaping (_ data: [ECItem], _ error: NSError?) -> Void) -> Void {

    let newURL = URL(string:"https://fake-mobile-backend.herokuapp.com/api/current_fix")

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
                            completionHandler(objectArray, nil)
                        }
                    }else {
                        print("error retrieving fix")
                    }
                }else {
                    print("error performing request")
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "badRequest"), object: nil)
                }
        })
    }
    }
    
    



func updateCurrentFix(_ keptItemsArray: [String], completionHandler: @escaping (_ data: ECInvoice, _ error: NSError?) -> Void) -> Void {


    let newURL = URL(string:"https://fake-mobile-backend.herokuapp.com/api/current_fix")

    let params = ["keep" : keptItemsArray]

    if let requestUrl = newURL {

        let putRequest = ECRequest(requestMethod: "PUT", url: requestUrl, params: params as [String : AnyObject])

        putRequest.performRequestWithHandler(
            { (success: Bool, object: AnyObject?) -> Void in

                var newResponseObject: ECInvoice


                if success {
                    if let dic = object as? [String:AnyObject]{
                        newResponseObject = ECInvoice(dictionary: dic)

                        if dic.isEmpty == false {
                            completionHandler(newResponseObject, nil)
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








