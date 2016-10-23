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
    var URL: Foundation.URL
    var params: [String : AnyObject]


    typealias ECRequestHandler = (_ success: Bool, _ object: AnyObject?) -> ()


    init(requestMethod: String, url: Foundation.URL, params: [String : AnyObject] ) {
        self.requestMethod = requestMethod
        self.URL = url
        self.params = params


    }

    func preparedURLRequest() -> URLRequest {

        let preparedURLString = self.URL.absoluteString
        let preparedURL = Foundation.URL(string: preparedURLString)
        let request = NSMutableURLRequest(url: preparedURL!)
        request.httpMethod = self.requestMethod

        if requestMethod == "PUT" {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
                // here "jsonData" is the dictionary encoded in JSON data
                request.httpBody = jsonData
                return request as URLRequest

            } catch let error as NSError {
                print(error)
            }
            
        }

        return request as URLRequest
        
        
    }

    func performRequestWithHandler(_ handler: @escaping ECRequestHandler) {

        let request = preparedURLRequest()
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request, completionHandler: {(responseData, response, error) ->  Void in
            if let data = responseData {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    handler(true, json as AnyObject?)
                }else {
                    print("error: \(error!.localizedDescription)")
                    handler(false, json as AnyObject?)

                }
            }
            }) .resume()
    }
    
    
}
