//
//  Deals.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation

class Deals: UIViewController{
    override func viewDidLoad() {
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
}