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

class FindUs: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate{
    
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        enableLocationServices(true)
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        let location = CLLocationCoordinate2DMake(40.041667, -76.305836)
        
        let span = MKCoordinateSpanMake(0.0002, 0.0002)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Federal Taphouse"
        annotation.subtitle = "201 N Queen Street Lancaster, Pennsylvania"
        
        mapView.addAnnotation(annotation)
        
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways: fallthrough
        case .AuthorizedWhenInUse:
            enableLocationServices(true)
        default:
            break
        }
    }
    
    private func enableLocationServices(enabled: Bool) {
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedAlways: fallthrough
        case .AuthorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            if enabled {
                locationManager.startUpdatingLocation()
            }
            else {
                locationManager.stopUpdatingLocation()
            }
        case  .NotDetermined: break
        case .Denied: break
        case .Restricted: break
        }

    }
}
