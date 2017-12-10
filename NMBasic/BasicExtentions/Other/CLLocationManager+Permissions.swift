//
//  CLLocationManager+Permissions.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import CoreLocation

public extension CLLocationManager {
    
    public class func isLocationServicesEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() != .denied {
            return true
        }
        return false
    }
    
    public class func isLocationServicesNotDetermined() -> Bool {
        if  CLLocationManager.authorizationStatus() == .notDetermined   {
            return true
        }
        return false
    }
    
    public class func requestWhenUseLocationPermission (delegate: CLLocationManagerDelegate)  {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.delegate = delegate
    }
    
}
