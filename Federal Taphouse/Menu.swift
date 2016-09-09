//
//  Menu.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Menu: UITableViewController{
    var menu = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.menu = [Data(name: "House Made Soft Pretzel"), Data(name: "Crispy Calamari"), Data(name: "Bacon Jam"), Data(name: "Hummus"), Data(name: "House Made Pierogis"), Data(name: "Coal Fired Wings"), Data(name: "Wood Fired Stuffed Jalapeños"), Data(name: "Devils on Horseback"), Data(name: "Dreamweaver Mussels"), Data(name: "Crab Mac and Cheese"), Data(name: "Charcuterie Board"), Data(name: "Soup of the Day")]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var getMenu : Data
        
        getMenu = menu[indexPath.row]
        
        cell.textLabel?.text = getMenu.name
        
        return cell
    }
}
