//
//  Helper.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/8/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import GoogleSignIn
import LocalAuthentication
import Firebase

class Helper{
    static let helper = Helper()
    
    func guest() {
        print("guest login did pressed")
        
        FIRAuth.auth()?.signInAnonymouslyWithCompletion({ (anonymousUser: FIRUser?, error: NSError?) in
            if error == nil{
                print("User ID: \(anonymousUser!.uid)")
                self.switchToSWRevealViewController()
            }
            else{
                print(error!.localizedDescription)
                return
            }
        })
    }
    
    func loginWithGoogle(authentication : GIDAuthentication){
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else{
                print(user?.email)
                print(user?.displayName)
                
                self.switchToSWRevealViewController()
            }
        })
    }
    
    func TouchIDCall(){
        let authContext: LAContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Please provide your fingerprint", reply: {
                (wasSuccessful: Bool, error: NSError?) in
                
                if wasSuccessful{
                    NSLog("Yes")
                    self.switchToSWRevealViewController()
                }
                else{
                    NSLog("No")
                }
                
            })
        }
        else{
            
        }
    }
    
    
    private func switchToSWRevealViewController(){
        // Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate a navigation controller
        let revealVC = storyboard.instantiateViewControllerWithIdentifier("RevealVC") as! SWRevealViewController
        
        // Get the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Set navigation controller as root view controller
        appDelegate.window?.rootViewController = revealVC
    }

}
