//
//  NSURLRequest+simple.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Foundation

extension URLRequest {
    
    static func requestWithURL(_ URL: Foundation.URL,
                               method: String,
                               queryParameters: [String: String]? = nil,
                               bodyParameters: NSDictionary? = nil,
                               headers: [String: String]? = nil) -> URLRequest {
        
        let actualURL: Foundation.URL
        
        // if there is a query string, append it to URL
        if let queryParameters = queryParameters {
            //
            
            // TODO: add the query param options with URLComponents
            actualURL = URL
        } else {
            actualURL = URL
        }
        
        // Make the request for the given method
        let request = NSMutableURLRequest(url: actualURL)
        
        // TODO: haven't checked if method is legit
        request.httpMethod = method
        
        // add body JSON parameters (for POSTs)
        if let bodyParameters = bodyParameters {
            //
            
            // TODO: create body paramters
        }
        
        // add extra headers if given
        if let headers = headers {
            for (field, value) in headers {
                request.addValue(value, forHTTPHeaderField: field)
            }
        }

        return request as URLRequest
    }
}
