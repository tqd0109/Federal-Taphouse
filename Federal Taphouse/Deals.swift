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
        
        self.menu = [Data(name: "Monday Night - $6 Cheesesteaks starting at 5pm. 10 Select beers only $2 from 6pm-8pm"), Data(name: " Tuesday Night - $6 Cheeseburgers starting at 5pm"), Data(name: "Wednesday Night - Buck a Shucks and IPAs- $2 off all IPAs 6pm-8pm and $1 Oysters beginning at 5pm"), Data(name: "Thursday Night - 1/2 price 10 select beers 6-8pm and $5 cheese pizzas beginning at 5pm"), Data(name: "Friday Night - Extended Hoppy Hour from 4pm-6pm")]
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
