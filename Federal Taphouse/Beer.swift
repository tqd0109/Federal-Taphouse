//
//  Beer.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/9/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class Beer: UITableViewController, NSXMLParserDelegate {
    
    @IBOutlet var tbData: UITableView!
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
//    var beer_name = NSMutableString()
    var CategoryID = NSMutableString()
    var CategoryName = NSMutableString()
//    var beer_location = NSMutableString()
//    var beer_ABV = NSMutableString()
//    var beer_size = NSMutableString()
//    var beer_price = NSMutableString()
//    var beer_description = NSMutableString()
//    var beer_category_name = NSMutableString()
//    var beer_date_added = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.beginParsing()
        
        
    }
    // Begin parsing
    func beginParsing()
    {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:"http://www.softwaremerchant.com/onlinecourse.asmx/getCategories"))!)!
        parser.delegate = self
        parser.parse()
        
        tbData!.reloadData()
    }
    
    
    // Past the value into tableview
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("Category")
        {
            elements = NSMutableDictionary()
            elements = [:]
            
            CategoryID = NSMutableString()
            CategoryID = ""
            
            CategoryName = NSMutableString()
            CategoryName = ""
//            
//            beer_location = NSMutableString()
//            beer_location = ""
//            
//            beer_ABV = NSMutableString()
//            beer_ABV = ""
//            
//            beer_size = NSMutableString()
//            beer_size = ""
//            
//            beer_price = NSMutableString()
//            beer_price = ""
//            
//            beer_description = NSMutableString()
//            beer_description = ""
//            
//            beer_category_name = NSMutableString()
//            beer_category_name = ""
//            
//            beer_date_added = NSMutableString()
//            beer_date_added = ""
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("Category") {
            if !CategoryID.isEqual(nil) {
                elements.setObject(CategoryID, forKey: "CategoryID")
            }
            if !CategoryName.isEqual(nil) {
                elements.setObject(CategoryName, forKey: "CategoryName")
            }
//            if !beer_location.isEqual(nil) {
//                elements.setObject(beer_location, forKey: "beer_location")
//            }
//            if !beer_ABV.isEqual(nil) {
//                elements.setObject(beer_ABV, forKey: "beer_ABV")
//            }
//            if !beer_size.isEqual(nil) {
//                elements.setObject(beer_size, forKey: "beer_size")
//            }
//            if !beer_price.isEqual(nil) {
//                elements.setObject(beer_price, forKey: "beer_price")
//            }
//            if !beer_description.isEqual(nil) {
//                elements.setObject(beer_description, forKey: "beer_description")
//            }
//            if !beer_category_name.isEqual(nil) {
//                elements.setObject(beer_category_name, forKey: "beer_category_name")
//            }
//            if !beer_date_added.isEqual(nil) {
//                elements.setObject(beer_date_added, forKey: "beer_date_added")
//            }
            
            posts.addObject(elements)
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("CategoryID") {
            CategoryID.appendString(string)
        }
        
        if element.isEqualToString("CategoryName") {
            CategoryName.appendString(string)
        }
//        else if element.isEqualToString("beer_location") {
//            beer_location.appendString(string)
//        }
//        else if element.isEqualToString("beer_ABV") {
//            beer_ABV.appendString(string)
//        }
//        else if element.isEqualToString("beer_size") {
//            beer_size.appendString(string)
//        }
//        else if element.isEqualToString("beer_price") {
//            beer_price.appendString(string)
//        }
//        else if element.isEqualToString("beer_description") {
//            beer_description.appendString(string)
//        }
//        else if element.isEqualToString("beer_category_name") {
//            beer_category_name.appendString(string)
//        }
//        else if element.isEqualToString("beer_date_added") {
//            beer_date_added.appendString(string)
//        }
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
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("CategoryName") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_location") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_ABV") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_size") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_price") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_description") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_category_name") as! NSString as String
//        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("beer_date_added") as! NSString as String
        
        return cell as UITableViewCell
    }
    
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //if such cell exists and destination controller (the one to show) exists too..
        if let subjectCell = tableView.cellForRowAtIndexPath(indexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewControllerWithIdentifier("BeerDetailVC") as? BeerListTableViewController{
            //Then just push the controller into the view hierarchy
            navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }

    
}
