//
//  ContactUs.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class ContactUs: UITableViewController{
    
    var contact = [Data]()
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.contact = [Data(name: "Call Us"), Data(name: "Facebook"), Data(name: "Twitter"), Data(name: "Instagram")]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contact.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var getContact : Data
        
        getContact = contact[indexPath.row]
        
        cell.textLabel?.text = getContact.name
        
        return cell
    }
}