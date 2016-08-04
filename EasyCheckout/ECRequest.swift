//
//  ECRequest.swift
//  EasyCheckout
//
//  Created by parry on 8/3/16.
//  Copyright © 2016 MCP. All rights reserved.
//

import UIKit



final class ECRequest: NSObject {

    var requestMethod: String
    var URL: NSURL

    typealias ECRequestHandler = (success: Bool, object: AnyObject?) -> ()


    init(requestMethod: String, url: NSURL) {
        self.requestMethod = requestMethod
        self.URL = url

    }

    func preparedURLRequest() -> NSURLRequest {

        let preparedURLString = self.URL.absoluteString
        let preparedURL = NSURL(string: preparedURLString)
        let request = NSMutableURLRequest(URL: preparedURL!)
        request.HTTPMethod = self.requestMethod

        return request


    }

    func performRequestWithHandler(handler: ECRequestHandler) {

        let request = preparedURLRequest()
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        session.dataTaskWithRequest(request) {(responseData, response, error) ->  Void in
            if let data = responseData {
                let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
                if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
                    handler(success: true, object: json)
                }else {
                    print("error: \(error!.localizedDescription)")
                    handler(success: false, object: json)

                }
            }
            }.resume()
    }
    
    
}
