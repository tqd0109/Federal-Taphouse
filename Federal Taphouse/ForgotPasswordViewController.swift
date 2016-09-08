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
    }
}
