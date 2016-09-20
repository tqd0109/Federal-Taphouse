//
//  Starters.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/20/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class Starters: UITableViewController {

    var names = ["Appetizers": ["House Made Soft Pretzel", "Bacon Jam", "Hummus", "House Made Pierogis", "Coal Fired Wings", "Wood Fired Stuffed Jalapeños", "Devils on Horseback", "Dreamweaver Mussels", "Crab Mac and Cheese", "Charcuterie Board", "Soup of the Day"], "Greens": ["Arugula Salad", "Caesar Salad", "Bibb Lettuce", "Asian Vegetable Salad", "Panzanella"], "Fed Fries": ["Aioli", "Poutine", "Braised Short Rib"]]
    
    struct Objects {
        
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        for (key, value) in names {
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return objectArray[section].sectionName
    }

}
