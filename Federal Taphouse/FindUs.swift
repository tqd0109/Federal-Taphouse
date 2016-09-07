//
//  FindUs.swift
//  Federal Taphouse
//
//  Created by Trung Quoc Do on 9/6/16.
//  Copyright © 2016 Software Merchant. All rights reserved.
//

import Foundation
//import MapKit

class FindUs: UITableViewController{
    
//    @IBOutlet var theMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
//        let latitude:CLLocationDegrees = 48.399193
//        let longtitude:CLLocationDegrees = 9.993341
//        
//        let latDelta:CLLocationDegrees = 0.01
//        let longDelta:CLLocationDegrees = 0.01
//        
//        let theSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        
//        let wantedLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
//        
//        let theRegion: MKCoordinateRegion = MKCoordinateRegionMake(wantedLocation, theSpan)
//        
//        self.theMapView.setRegion(theRegion, animated: true)
//        
//        let wantedAnnotation = MKPointAnnotation()
//        
//        wantedAnnotation.coordinate = wantedLocation
//        
//        wantedAnnotation.title = "Federal Taphouse Lancaster"
//        wantedAnnotation.subtitle = "201 N Queen Street Lancaster, Pennsylvania"
//        
//        self.theMapView.addAnnotation(wantedAnnotation)
        
    }
}
