//
//  Beer.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/9/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Beer: UITableViewController {
    var menu = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.menu = [Data(name: "Corona"), Data(name: "Saigon Beer"), Data(name: "Budweiser"), Data(name: "Budlight"), Data(name: "Tiger Beer")]
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
