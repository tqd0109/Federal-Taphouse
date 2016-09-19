//
//  Feedback.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/19/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit
import MessageUI

class Feedback: UITableViewController, MFMailComposeViewControllerDelegate {

    var TableArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableArray = ["Rate Us", "Send Feedback"]
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    // Set up table view
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected row = \(indexPath.description)")
        
        if indexPath.section == 0 && indexPath.row == 0{
            print("Rate us tapped")
            
            let alertController = UIAlertController(title: "Rate Us!", message: "Do you enjoy the app? Please rate it so we have more motivation to improve :)", preferredStyle: .Alert)
            
            alertController.addAction(UIAlertAction(title: "Rate on Itunes", style: .Default, handler: { (action: UIAlertAction!) in
                print("Rate us tapped")
                print("Sent to Itunes")
            }))
            
            alertController.addAction(UIAlertAction(title: "Send us feedback", style: .Default, handler: { (action: UIAlertAction!) in
                print("Feedback tapped")
                let mailComposeViewController = self.configureMailComposeViewController()
                if MFMailComposeViewController.canSendMail(){
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                }
                else{
                    self.showSendEmailErrorAlert()
                }
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                print("Rate us cancelled tapped")
            }))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            
        }
        
        if indexPath.section == 0 && indexPath.row == 1{
            print("Feedback tapped")
            let mailComposeViewController = configureMailComposeViewController()
            if MFMailComposeViewController.canSendMail(){
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }
            else{
                self.showSendEmailErrorAlert()
            }
        }
    }
    
    func configureMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["info@federaltaphouse.com"])
        mailComposerVC.setSubject("Application feedback")
        mailComposerVC.setMessageBody("Hello! I would like to share the following feedback: ", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendEmailErrorAlert(){
        
        let sendMailErrorAlert = UIAlertView(title: "Could not send email", message: "Your device could not send email. Please check email configuration and try again", delegate: self, cancelButtonTitle: "OK")
        
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch (result){
            
        case MFMailComposeResult.Cancelled:
            print("Cancelled mail")
            
        case MFMailComposeResult.Sent:
            print("Mail sent")
            
        default:
            break
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
