//
//  simpleRequests.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Foundation

class simpleRequests {
    
    typealias NetworkingCompletion = (String) -> Void
    
    static func get(_ qParameters: [String: String]? = nil, completion: @escaping NetworkingCompletion) {

        requestWithMethod(requestType: "GET",
                          queryParameters: qParameters,
                          completionHandler: completion)
    }
    
    static func put(_ bParameters: NSDictionary? = nil, completion: @escaping NetworkingCompletion) {
        requestWithMethod(requestType: "PUT",
                          bodyParameters: bParameters,
                          completionHandler: completion)
    }

    static func post(_ bParameters: NSDictionary? = nil, completion: @escaping NetworkingCompletion) {
        requestWithMethod(requestType: "POST",
                          bodyParameters: bParameters,
                          completionHandler: completion)
    }

    static func delete(_ bParameters: NSDictionary? = nil, completion: @escaping NetworkingCompletion) {
        requestWithMethod(requestType: "DELETE",
                          bodyParameters: bParameters,
                          completionHandler: completion)
    }
    

    
    /// Used to contain the common code for GET and POST and DELETE and PUT.
    static fileprivate func requestWithMethod(requestType method:String,
                                       queryParameters: [String: String]? = nil,
                                       bodyParameters: NSDictionary? = nil,
                                       completionHandler: @escaping NetworkingCompletion) {
        
        let myUrl = Foundation.URL(string: Constants.baseURL)!
        let request = URLRequest.requestWithURL(myUrl,
                                                method: method,
                                                queryParameters: queryParameters,
                                                bodyParameters: bodyParameters,
                                                headers: nil)
        
        
        let task = URLSession.sharedSimpleSession.dataTask(with: request, completionHandler: {
            data, response, sessionError in
            
            // check for non-200 response, as URLSession doesn't raise that as an error
            if let httpResponse = response as? HTTPURLResponse {
                
                print("ReponseCode = \(httpResponse.statusCode)")

                var error = sessionError

                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
                        let description = "HTTP response was \(httpResponse.statusCode)"
                        error = NSError(domain: "Networking", code: 2016, userInfo: [NSLocalizedDescriptionKey: description])
                    }
                }
            }
            if let data = data {
                print("data = \(data)")
                let dataNSString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                if let dataString = dataNSString {
                    completionHandler(dataString as! String)
                }
                else {
                    completionHandler(String("NIL"))
                }
            } else {
                completionHandler(String("NIL"))
            }
            
        })
        task.resume()
    }

    
    // MARK: - Constants
    
    struct Constants {
        /// This is the base URL for your requests.
        //        static let baseURL = URL(string: "https://api.github.com/")!
        static let baseURL = String("https://localhost:8090")!
    }
    
}
