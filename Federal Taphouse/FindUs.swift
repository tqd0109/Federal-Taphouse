//
//  FindUs.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class FindUs: UITableViewController{
    
    @IBOutlet var mapView: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        let location = CLLocationCoordinate2DMake(40.041667, -76.305836)
        
        let span = MKCoordinateSpanMake(0.0002, 0.0002)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Federal Taphouse"
        annotation.subtitle = "Awesome drinking place"
        
        mapView.addAnnotation(annotation)
        
        
    }


}
