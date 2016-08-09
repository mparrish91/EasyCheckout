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
    var params: [String : AnyObject]


    typealias ECRequestHandler = (success: Bool, object: AnyObject?) -> ()


    init(requestMethod: String, url: NSURL, params: [String : AnyObject] ) {
        self.requestMethod = requestMethod
        self.URL = url
        self.params = params


    }

    func preparedURLRequest() -> NSURLRequest {

        let preparedURLString = self.URL.absoluteString
        let preparedURL = NSURL(string: preparedURLString)
        let request = NSMutableURLRequest(URL: preparedURL!)

        //try this if not, convert to raw json/ then set the body
//        let data = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
//        let string = NSString(data: data, encoding: NSUTF8StringEncoding)

        if requestMethod == "PUT" {
            var paramString = ""
            for (key, value) in params {
                let escapedKey = key.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
                let escapedValue = value.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
                paramString += "\(escapedKey)=\(escapedValue)&"

                request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
            }
            return request
        }


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
