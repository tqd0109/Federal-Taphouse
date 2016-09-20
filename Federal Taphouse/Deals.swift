//
//  Deals.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Deals: UITableViewController{
    var TableArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        TableArray = ["$6 Cheesesteaks starting at 5pm. 10 Select beers only $2 from 6pm-8pm", "$6 Cheeseburgers starting at 5pm", "Buck a Shucks and IPAs- $2 off all IPAs 6pm-8pm and $1 Oysters beginning at 5pm", "1/2 price 10 select beers 6-8pm and $5 cheese pizzas beginning at 5pm", "Extended Hoppy Hour from 4pm-6pm"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
}
