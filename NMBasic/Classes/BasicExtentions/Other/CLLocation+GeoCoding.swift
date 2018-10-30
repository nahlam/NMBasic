//
//  CLLocation+GeoCoding.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/9/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import CoreLocation

public typealias GeoLocationClosureType = (_ locationName: String?) -> Void

public extension CLLocation    {
    
    public func reverseGeocodeLocation(handler: @escaping GeoLocationClosureType) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(self) { (placemarks, error) in
            if placemarks != nil {
                
                if let info = placemarks!.last{
                    var address = String()
                    var sep = ""
                    
                    if let street = info.addressDictionary?["Street"] as? String   {
                        if street.count > 0 {
                            address += "\(sep) \(street)"
                            sep = ","
                        }
                    }
                    
                    if let locality = info.locality, info.locality!.count > 0 {
                        
                        address += "\(sep) \(locality)"
                        sep = ","
                    }else if let administrativeArea = info.administrativeArea, info.administrativeArea!.count > 0 {
                        
                        address += "\(sep) \(administrativeArea)"
                        sep = ","
                    }else if let country = info.country, info.country!.count > 0 {
                        
                        address += "\(sep) \(country)"
                        sep = ","
                    }
                    
                    handler(address)
                }
                else {
                    handler(nil)
                }
            }else   {
                handler(nil)
            }
            
        }
    }
}
