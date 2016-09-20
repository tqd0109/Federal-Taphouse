//
//  InitialViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/14/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = NSArray(objects: "Picture6", "Picture7", "Picture3", "Picture4", "Picture5")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyPageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var initialContentViewController = self.pageTutorialAtIndex(0) as TutorialPageContentHolderViewController
        var viewControllers = NSArray(object: initialContentViewController)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }

    @IBAction func skipButtonPressed(sender: AnyObject) {
        self.switchToHomeViewController()
    }
    
    func pageTutorialAtIndex(index:Int) -> TutorialPageContentHolderViewController{
        var pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialPageContentHolderViewController") as! TutorialPageContentHolderViewController
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var viewController = viewController as! TutorialPageContentHolderViewController
        var index = viewController.pageIndex as Int
        
        if (index == 0 || index == NSNotFound){
           return nil
        }
        index -= 1
        
        return self.pageTutorialAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var viewController = viewController as! TutorialPageContentHolderViewController
        var index = viewController.pageIndex as Int
        
        if (index == NSNotFound){
            return nil
        }
        index += 1
        
        if (index == pageImages.count) {
            return nil
        }
        else{
            return self.pageTutorialAtIndex(index)
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func switchToHomeViewController(){
        // Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate a navigation controller
        let initialVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! HomeViewController
        
        // Get the app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Set navigation controller as root view controller
        appDelegate.window?.rootViewController = initialVC
    }
}
