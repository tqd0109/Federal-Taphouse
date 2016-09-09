//
//  Deals.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Deals: UITableViewController{
    var menu = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.menu = [Data(name: "$6 Cheesesteaks starting at 5pm"), Data(name: "10 Select beers only $2 from 6pm-8pm"), Data(name: "$1 Oysters beginning at 5pm"), Data(name: "$5 cheese pizzas beginning at 5pm"), Data(name: "Extended Hoppy Hour from 4pm-6pm")]
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