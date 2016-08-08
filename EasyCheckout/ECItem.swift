//
//  ECItem.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import Foundation

final class ECItem: NSObject {

    private var id: String?
    var name : String?
    var brand : String?
    var price : String?
    var imageUrl : String?

    override init() {}


    init(dictionary: [String:AnyObject]) {
        super.init()

        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        price = dictionary["price"] as? String
        brand = dictionary["brand"] as? String
        imageUrl = dictionary["image_url"] as? String
    }
    
}
