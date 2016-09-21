//
//  BeerListTableViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/21/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class BeerListTableViewController: UITableViewController, NSXMLParserDelegate {

    @IBOutlet var tbData: UITableView!
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var beer_name = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.beginParsing()
        
        
    }
    // Begin parsing
    func beginParsing()
    {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://www.softwaremerchant.com/onlinecourse.asmx/getBeerList"))!)!
        parser.delegate = self
        parser.parse()
        
        tbData!.reloadData()
    }
    
    
    // Past the value into tableview
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("Beer")
        {
            elements = NSMutableDictionary()
            elements = [:]
            
            beer_name = NSMutableString()
            beer_name = ""
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("Beer") {
            if !beer_name.isEqual(nil) {
                elements.setObject(beer_name, forKey: "beer_name")
            }
            posts.addObject(elements)
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("beer_name") {
            beer_name.appendString(string)
        }
    }
    
    //Tableview Methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)![0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_name") as! NSString as String
        
        return cell as UITableViewCell
    }

}
