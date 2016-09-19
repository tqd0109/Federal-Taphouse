//
//  RightTableVCTableViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/19/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class RightTableVCTableViewController: UITableViewController {

    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Facebook", "Twitter", "Instagram", "Gallery", "Feedback"]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }


}
