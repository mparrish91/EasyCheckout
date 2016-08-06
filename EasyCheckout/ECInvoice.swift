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

        subtotal = dictionary["subtotal"] as? String
        tax = dictionary["tax"] as? String
        total = dictionary["total"] as? String

    }


    
}