//
//  Starters.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/20/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class Starters: UITableViewController {
    
    var section = ["Appetizers", "Greens", "Fed Fries"]

    var items = [["House Made Soft Pretzel", "Bacon Jam", "Hummus", "House Made Pierogis", "Coal Fired Wings", "Wood Fired Stuffed Jalapeños", "Devils on Horseback", "Dreamweaver Mussels", "Crab Mac and Cheese", "Charcuterie Board", "Soup of the Day"], ["Arugula Salad", "Caesar Salad", "Bibb Lettuce", "Asian Vegetable Salad", "Panzanella"], ["Aioli", "Poutine", "Braised Short Rib"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    // Construct tableview
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.section.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items [section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section [section]
    }
}
