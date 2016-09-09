//
//  Facebook.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/9/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class Facebook: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        // Do any additional setup after loading the view.
        let url = NSURL(string: "https://www.facebook.com/FedTapLanc")
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }
}
