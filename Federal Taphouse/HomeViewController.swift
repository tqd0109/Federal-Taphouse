//
//  HomeViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit
import GoogleSignIn
import LocalAuthentication

class HomeViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        GIDSignIn.sharedInstance().clientID = "889512112077-jmfsp2pq1njicqkhuk2fpbuaq27l0u75.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    


    @IBAction func loginButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func forgotPasswordButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func touchIDButtonTapped(sender: AnyObject) {
       print("Touch ID did finished")
        Helper.helper.TouchIDCall()
    }
    
    
    @IBAction func guestButtonPressed(sender: AnyObject) {
        
        print("guest login did pressed")
        Helper.helper.guest()
    }
    
    @IBAction func googleLoginButtonPressed(sender: AnyObject) {
        print("Google login did pressed")
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil{
            print(error!.localizedDescription)
            return
        }
        print(user.authentication)
        Helper.helper.loginWithGoogle(user.authentication)
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
