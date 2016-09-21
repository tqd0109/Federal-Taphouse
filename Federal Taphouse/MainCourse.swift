//
//  MainCourse.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/20/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class MainCourse: UITableViewController {
    
    var section = ["Artisan Pizzas", "Entrees", "Coal and Wood Fired Specialties", "Sandwiches", "Pressed Sandwiches"]

    var items = [["Margherita", "Heirloom Tomato", "BBQ Chicken", "Roasted Mushroom", "Pepperoni", "Asparagus", "Four Cheese", "Polpette", "Sausage","Duck Confit", "Shrimp and Chorizo", "Potato", "Delicata Squash"], ["Braised Short Rib", "Lump Crab Cakes", "Fish and Chips"], ["Steak Frites", "Bone In Pork Chop", "Cedar Plank Scottish Salmon", "Wood Fired Striped Bass"], ["Taphouse Burger", "Bison Burger", "Korean BBQ Beef", "Southwest Black Bean Burger", "Lump Crab Cake Sandwich", "Pulled Smoked BBQ Chicken", "Coal Fired Ribeye Tacos", "Pork Belly and Watermelon Tacos", "Coal Fired Swordfish Tacos"], ["Duck Confit", "Cubano", "Vegetarian"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    // MARK: - Table view data source
    
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
