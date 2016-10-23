//
//  ECInvoice.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import Foundation


final class ECInvoice: NSObject {

    var subtotal: Float?
    var tax : Float?
    var total : Float?


    init(dictionary: [String:AnyObject]) {
        super.init()

        if let sub = dictionary["subtotal"] as? Float {
            subtotal = sub
        }

        if let tx = dictionary["tax"] as? Float {
            tax = tx
        }

        if let tl = dictionary["total"] as? Float {
            total = tl 
        }
    }


    
}