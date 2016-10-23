//
//  UIImageViewExtensions.swift
//  EasyCheckout
//
//  Created by parry on 8/7/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit



extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: URL(string:link)!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
