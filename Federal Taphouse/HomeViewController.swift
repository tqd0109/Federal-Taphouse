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
import Firebase

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
        if self.emailField.text == "" || self.passwordField.text == ""{
            let alertController = UIAlertController(title: "Oops", message: "Please enter email and password", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.signInWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil{
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    
                    // Create a main storyboard instance
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    // Instantiate a navigation controller
                    let naviVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! SecondNavigationController
                    
                    // Get the app delegate
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    
                    // Set navigation controller as root view controller
                    appDelegate.window?.rootViewController = naviVC
                }
                else{
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == ""{
            let alertController = UIAlertController(title: "Oops", message: "Please enter email and password", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.createUserWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil{
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                else{
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
        }
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
