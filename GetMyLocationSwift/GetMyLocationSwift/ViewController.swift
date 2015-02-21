//
//  ViewController.swift
//  GetMyLocationSwift
//
//  Created by Semih Onay on 21.02.2015.
//  Copyright (c) 2015 Semih Onay. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
            CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in

                if (error != nil) {
             
                    println("Error:" + error.localizedDescription)
                    return
                }
                if placemarks.count > 0 {
                    
                    
                    
                    let pm = placemarks[0] as CLPlacemark
                    
                    self.displayLocationInfo(pm)
                    
                    
                    
                }else {
                    
                    println("Error with data")
                    
                }
            })
        }
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
        self.locationManager.startUpdatingLocation()
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        println("Error: " + error.localizedDescription)
        
    }
}
