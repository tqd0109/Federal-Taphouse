//
//  Invite.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation
import MessageUI

class Invite: UIViewController, MFMessageComposeViewControllerDelegate{
    
    @IBOutlet var phoneNumber: UITextField!
    override func viewDidLoad() {
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func sendText(sender: AnyObject) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = [phoneNumber.text!]
            controller.messageComposeDelegate = self
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
}