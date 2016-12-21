//
//  ViewController.swift
//  simpleApp
//
//  Created by Gelareh Taban on 12/20/16.
//  Copyright © 2016 gadphly. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        simpleRequests.get(){ response in
                print(response)
            }
        }

    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

