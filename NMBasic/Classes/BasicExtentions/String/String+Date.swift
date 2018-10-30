//
//  String+Date.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/12/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension String {
    
    public func convert24HTimeToDate() -> Date {
        let dateFormatter = DateFormatter.getTimeFormatter()
        return dateFormatter.date(from: self) ?? Date()
    }
    
    public func convert12HTimeToDate() -> Date {
        let dateFormatter = DateFormatter.get12TimeFormatter()
        return dateFormatter.date(from: self) ?? Date()
    }
    
    public func convertToFullDate() -> Date? {
        let dateFormatter = DateFormatter.getFullFormatter()
        return dateFormatter.date(from: self)
    }
}
