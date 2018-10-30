//
//  Date+ChangeTime.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/10/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Date {
    
    public func setTime(hour: Int, min: Int, sec: Int, timeZoneAbbrev: String = "UTC") -> Date? {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)
        
        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
        components.hour = hour
        components.minute = min
        components.second = sec
        
        return cal.date(from: components)
    }
}
