//
//  TutorialPageContentHolderViewController.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/14/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import UIKit

class TutorialPageContentHolderViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var imageFileName : String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageFileName)
    }
}
