//
//  MainCourse.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/20/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class MainCourse: UITableViewController {

    var names = ["Artisan Pizzas": ["Margherita", "Heirloom Tomato", "BBQ Chicken", "Roasted Mushroom", "Pepperoni", "Asparagus", "Four Cheese", "Polpette", "Sausage","Duck Confit", "Shrimp and Chorizo", "Potato", "Delicata Squash"], "Entrees": ["Braised Short Rib", "Lump Crab Cakes", "Fish and Chips"], "Coal and Wood Fired Specialties": ["Steak Frites", "Bone In Pork Chop", "Cedar Plank Scottish Salmon", "Wood Fired Striped Bass"], "Sandwiches": ["Taphouse Burger", "Bison Burger", "Korean BBQ Beef", "Southwest Black Bean Burger", "Lump Crab Cake Sandwich", "Pulled Smoked BBQ Chicken", "Coal Fired Ribeye Tacos", "Pork Belly and Watermelon Tacos", "Coal Fired Swordfish Tacos"], "Pressed Sandwiches": ["Duck Confit", "Cubano", "Vegetarian"]]
    
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
