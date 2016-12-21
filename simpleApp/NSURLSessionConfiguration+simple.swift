//
//  NSURLSessionConfiguration+simple.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Foundation

extension URLSessionConfiguration {
    
    /// Just like defaultSessionConfiguration, 
    /// returns a newly created session configuration object, 
    /// customised from the default to my requirements.
    
    class func simpleSessionConfiguration() -> URLSessionConfiguration {
        
        let config = `default`
        
        config.timeoutIntervalForRequest = 20                       // Make things timeout quickly.
        config.httpAdditionalHeaders = ["MyResponseType": "JSON"]   // My web service needs to be explicitly asked for JSON.
        config.httpShouldUsePipelining = true                       // Might speed things up if your server supports it.
        return config
    }
    
}
