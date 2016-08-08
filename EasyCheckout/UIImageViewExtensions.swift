//
//  UIImageViewExtensions.swift
//  EasyCheckout
//
//  Created by parry on 8/7/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit



extension UIImageView {
    func downloadImageFrom(link link:String, contentMode: UIViewContentMode) {
        NSURLSession.sharedSession().dataTaskWithURL( NSURL(string:link)!, completionHandler: {
            (data, response, error) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
