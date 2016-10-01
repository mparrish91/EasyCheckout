//
//  ECInvoice.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import Foundation


final class ECInvoice: NSObject {

    var subtotal: String?
    var tax : String?
    var total : String?


    init(dictionary: [String:AnyObject]) {
        super.init()

        if let sub = dictionary["subtotal"] as? Int {
            subtotal = String(sub)
        }

        if let tx = dictionary["tax"] as? Int {
            tax = String(tx)
        }

        if let tl = dictionary["total"] as? Int {
            total = String(tl)
        }
    }


    
}