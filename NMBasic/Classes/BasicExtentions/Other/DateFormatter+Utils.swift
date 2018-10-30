//
//  DateFormatter.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension DateFormatter {
    
    public struct Formats {
        
        static let Event                            = "yyyy-MM-dd'T'HH:mmZZZ"
        static let Full                             = "yyyy-MM-dd HH:mm:ss"
        static let FullMinusYear                    = "MM-dd HH:mm"
        static let YMD                              = "yyyy-MM-dd"
        static let DFMY                             = "dd MMM yyyy"
        static let DFMYSmall                        = "d MMM yyyy"
        static let Time                             = "HH:mm"
        static let Time12                           = "hh:mm a"
        static let Hour12                           = "h a"
        static let UTC                              = "UTC"
        static let EEEE                             = "EEEE"
    }
    
    public class func getFullFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.Full
        return formatter
    }
    
    public class func getFullFormatterWithoutYear () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.FullMinusYear
        return formatter
    }
    
    public class func getDayWordMonthFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.DFMY
        return formatter
    }
    
    public class func getDayFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.YMD
        return formatter
    }
    
    public class func getTimeFormatter () -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.Time
        return formatter
    }
    
    public class func  get12TimeFormatter() -> DateFormatter   {
        let formatter: DateFormatter = getDateFormatter()
        formatter.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        formatter.dateFormat = DateFormatter.Formats.Time12
        return formatter
    }
    
    public class func getDateFormatter() -> DateFormatter   {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-US")
        return formatter
    }
    
    public class func  nm_currentYear() -> Int {
        let gregorian: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let year: Int = (gregorian as NSCalendar).component(.year, from: Date())
        return year
    }
}
