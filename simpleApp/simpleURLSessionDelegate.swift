//
//  simpleURLSessionDelegate.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Foundation

// inherit from NSObject
// extends URLSessionDelegate protocol
class simpleURLSessionDelegate: NSObject, URLSessionDelegate {
    
    // MARK: - NSURLSessionDelegate
    
    // have to over-ride this function because we want to use self-signed certificates
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // overriding
        
        // protectionSpace = object represents a server or a realm, that requires authentication
        // authenticationMethod = The authentication method used by the receiver.
        // NSURLAuthenticationMethodServerTrust = This authentication method can apply to any protocol, 
        //                      and is most commonly used for overriding SSL and TLS chain validation.
        // host =  receiver's host
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust &&
            Constants.selfSignedHosts.contains(challenge.protectionSpace.host) {
            
            // serverTrust = A representation of the server’s SSL transaction state.
            // var serverTrust: SecTrust? { get }
            // nil if the authentication method of the protection space is not server trust.
            
            if let trustState = challenge.protectionSpace.serverTrust {
                
                // create object with server trust authentication initialized with the given accepted trust.
                let cred = URLCredential(trust: trustState)
                completionHandler(.useCredential, cred)
            }
        }
        else {
            // You *have* to call completionHandler either way, so call it to do the default action.
            
            completionHandler(.performDefaultHandling, nil)
        }
        
    }
    
    // MARK: - Constants
    
    struct Constants {
        
        // A list of hosts you allow self-signed certificates on.
        // You'd likely have your dev/test servers here.
        // Please don't put your production server here!
        
        static let selfSignedHosts: Set<String> = ["127.0.0.1", "test.example.com", "localhost", "BabbageEngine.local"]
    }
    
}
