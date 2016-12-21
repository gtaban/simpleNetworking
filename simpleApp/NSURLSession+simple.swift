//
//  NSURLSession+simple.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Foundation

extension URLSession {
    
    //returns a shared singleton object
    
    class var sharedSimpleSession : URLSession {
        
        // session stored in a struct because you can't do 
        // 'static let' singleton in a class extension
        
        struct Instance {
            
            // the singleton URLSession object, configured to use
            // our custom configuration and delegate
            
            static let session = URLSession(configuration: URLSessionConfiguration.simpleSessionConfiguration(),
                                            delegate: simpleURLSessionDelegate(), // delegate is retained by the session
                                            delegateQueue: OperationQueue.main)
        }
        return Instance.session
    }
}
