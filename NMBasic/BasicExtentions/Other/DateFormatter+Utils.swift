//
//  DateFormatter.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation



public extension DateFormatter {
    
    struct Formats {
        
        static let Full                             = "yyyy-MM-dd HH:mm:ss"
        static let FullMinusYear                    = "MM-dd HH:mm"
        static let YMD                              = "yyyy-MM-dd"
        static let DFMY                             = "dd MMM yyyy"
        static let Time                             = "HH:mm"
        static let UTC                              = "UTC"
    }
    
    public static func getFullFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.Full
        return formatter
    }
    
    public static func getFullFormatterWithoutYear () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.FullMinusYear
        return formatter
    }
    
    public static func getDayWordMonthFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.DFMY
        return formatter
    }
    
    public static func getDayFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.YMD
        return formatter
    }
    
    public static func getTimeFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.Time
        return formatter
    }
    
    
    public static func getDateFormatter() -> DateFormatter   {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-US")
        return formatter
    }
}
