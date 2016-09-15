//
//  Beer.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/9/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class Beer: UITableViewController {
    var menu = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.menu = [Data(name: "Guiness"), Data(name: "Blue Moon"), Data(name: "Samuel Adams Boston Lager"), Data(name: "Corona"), Data(name: "Stella Artois"), Data(name: "Dos Equis"), Data(name: "Budweiser") , Data(name: "Sierra Nevada") , Data(name: "Fat Tire") , Data(name: "Yuengling Premium Beer") , Data(name: "Newcastle Brown Ale") , Data(name: "Dogfish Head") , Data(name: "Hoegaarde Witbier") , Data(name: "Michelob") , Data(name: "George Killian's Irish Red") , Data(name: "Foster's Lager") , Data(name: "Labatt Blue") , Data(name: "Chimay") , Data(name: "Sapporo Premium Lager") , Data(name: "Grolsch") , Data(name: "Molson Canadian") , Data(name: "Pilsner Urquell") , Data(name: "Pabst Blue Ribbon") , Data(name: "Amstel Lager")]
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
