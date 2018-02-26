//
//  Q8LocationManager.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/10/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import MapKit

public struct Typealiases {
    public typealias JSONDict = [String:Any]
}

public typealias LocationClosureType = (_ status: CLAuthorizationStatus , _ cllocation: CLLocation?) -> Void

open class BasicLocationManager: NSObject, CLLocationManagerDelegate {
    
    private(set) var manager: CLLocationManager
    private(set) var location: CLLocation?
    private(set) var region:MKCoordinateRegion?
    private(set) var locationString: String = ""
    private(set) var isLocationServicesEnabled = false
    private(set) var isLocationServicesNotAskedBefore = true
    open var updateBlock: LocationClosureType?
    
    public static var instance: BasicLocationManager? = nil
    
    public static let sharedInstance : BasicLocationManager = {
        let instance = BasicLocationManager()
        instance.initializeManager()
        return instance
    }()
    
    override init() {
        manager = CLLocationManager()
        
    }
    
    open func initializeManager()    {
        manager.delegate = self
    }
    
    
    
    open func requestWhenUseLocationPermission ()  {
        manager.requestWhenInUseAuthorization()
    }
    
    open func startUpdatingLocation  ()  {
        manager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined    {
            requestWhenUseLocationPermission()
        }else if status == .denied || status == .restricted {
            updateBlock?(status, nil)
        }else {
            manager.startUpdatingLocation()
            NotificationCenter.default.addObserver(self, selector: #selector(self.eneteredbackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        }
    }
    
    
    open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])   {
        
        if locations.count > 0 {
            self.update(cllocation: locations.last)
        }
        manager.stopUpdatingLocation()
        manager.stopMonitoringSignificantLocationChanges()
        manager.delegate = nil
        
    }
    
    @objc open  func eneteredbackground()   {
        manager.stopUpdatingLocation()
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    open func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse  || status == .authorizedAlways {
            self.isLocationServicesEnabled = true
            self.isLocationServicesNotAskedBefore = false
            startUpdatingLocation()
        }else if status == .notDetermined {
            self.isLocationServicesNotAskedBefore = true
        }else   {
            self.isLocationServicesEnabled = false
            self.isLocationServicesNotAskedBefore = false
            updateBlock?(status, nil)
        }
        
    }
    
    open func update(cllocation: CLLocation?) {
        
        self.location = cllocation
        if location != nil {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            self.region = MKCoordinateRegion(center: self.location!.coordinate, span: span)
            cllocation?.reverseGeocodeLocation(handler: { (address) in
                if address != nil {
                    self.locationString = address!
                }
                let status = CLLocationManager.authorizationStatus()
                self.updateBlock?(status, self.location)
            })
        }
    }
    
    static open func getAdress(cllocation: CLLocation, completion: @escaping (Typealiases.JSONDict) -> ()) {
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(cllocation) { (placemarks, error) -> Void in
            
            if error != nil {
                print("Error getting location: \(error!.localizedDescription)")
            } else {
                let placeArray = placemarks as [CLPlacemark]!
                var placeMark: CLPlacemark!
                placeMark = placeArray?[0]
                completion(placeMark.addressDictionary as! Typealiases.JSONDict)
            }
        }
    }
    
}
