//
//  Logout.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/8/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Logout: UIViewController{
    override func viewDidLoad() {
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        // Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate home controller
        let LogInVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! HomeViewController
        
        // Get the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Set navigation controller as root view controller
        appDelegate.window?.rootViewController = LogInVC
    }
}
