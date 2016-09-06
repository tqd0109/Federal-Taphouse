//
//  HomeViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    


    @IBAction func loginButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func forgotPasswordButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func touchIDButtonTapped(sender: AnyObject) {
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
