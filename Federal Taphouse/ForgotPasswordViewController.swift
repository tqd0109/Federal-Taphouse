//
//  ForgotPasswordViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/8/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    
    let homeViewController = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        homeViewController.resetPassword(emailField.text!)
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.switchToHomeViewController()
    }
    
    private func switchToHomeViewController(){
        // Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate a navigation controller
        let homeVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! HomeViewController
        
        // Get the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Set navigation controller as root view controller
        appDelegate.window?.rootViewController = homeVC
    }
}
