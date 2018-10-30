//
//  NSDate+Format.swift
//  4Sale
//
//  Created by Nahla Mortada on 7/25/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

public extension Date {
    
    @nonobjc static var eventEncoder: DateFormatter?

    public static func initialize() {
        eventEncoder = DateFormatter.getDateFormatter()
        eventEncoder!.timeZone = TimeZone(identifier: DateFormatter.Formats.UTC)
        eventEncoder!.dateFormat = DateFormatter.Formats.Event
    }
    
    /// get arabic day name from english day name
    public static func nm_getArabicDayNameFromDay(_ dayName: String) -> String {
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        formatter.dateFormat = DateFormatter.Formats.EEEE
        formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.ArabicSaudi)
        
        var weekdays: [String] = formatter.weekdaySymbols
        if (dayName.lowercased() == "Sunday".lowercased()) {
            return weekdays[0]
        }
        else if (dayName.lowercased() == "Monday".lowercased()) {
            return weekdays[1]
        }
        else if (dayName.lowercased() == "Tuesday".lowercased()) {
            return weekdays[2]
        }
        else if (dayName.lowercased() == "Wednesday".lowercased()) {
            return weekdays[3]
        }
        else if (dayName.lowercased() == "Thursday".lowercased()) {
            return weekdays[4]
        }
        else if (dayName.lowercased() == "Friday".lowercased()) {
            return weekdays[5]
        }
        
        return weekdays.last!
    }
    
    public static func  nm_dateFromEventEncodedString(_ string: String) -> Date {
        return Date.eventEncoder!.date(from: string)!
    }
    
    public func nm_duration(from date: Date) -> String {
        let secondsDiff = nm_seconds(from: date)
        if secondsDiff == 0 {
            return ""
        }
        
        
        let diffInSHM = nm_secondsToHoursMinutesSeconds(seconds: secondsDiff)
        if diffInSHM.h > 0 {
            if diffInSHM.h == 1 {
                return "\(diffInSHM.h) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Hour)) "
            }else {
                return "\(diffInSHM.h) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Hours)) "
            }
        }
        
        if diffInSHM.m > 0 {
            if diffInSHM.m == 1 {
                return "\(diffInSHM.m) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Minute)) "
            }else {
                return "\(diffInSHM.m) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Minutes)) "
            }
        }
        
        
        if diffInSHM.s > 0 {
            if diffInSHM.s == 1 {
                return "\(diffInSHM.s) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Second))"
            }else {
                return "\(diffInSHM.s) \(String.localized(key: BasicFrameworkManager.Strings.Formats.Seconds))"
            }
        }
        return ""
    }
    
    public func nm_secondsToHoursMinutesSeconds (seconds : Int) -> (h: Int, m: Int, s: Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    public func nm_seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    public func nm_formattedTimestampIsArabic(_ isArabic: Bool) -> String {
        return self.nm_formattedTimestamp(nil, isArabic: isArabic)
    }
    
    public func nm_formattedTimestamp(_ regionUTCDiff: String?, isArabic: Bool) -> String {
        var statusString: String
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        if regionUTCDiff != nil {
            formatter.timeZone = TimeZone(identifier: regionUTCDiff!)
        }
        if isArabic {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.Arabic)
        }
        else {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.EnglishDate)
        }
        let otherDay: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: self)
        let today: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: Date())
        if today.day == otherDay.day && today.month == otherDay.month && today.year == otherDay.year && today.era == otherDay.era {
            formatter.dateFormat = DateFormatter.Formats.Time12
            let theTime: String = formatter.string(from: self)
            let todayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Today)
            let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
            statusString = "\(todayString) \(atString) \(theTime)"
        }
        else {
            var yesterday: DateComponents = today
            yesterday.day = today.day! - 1
            if yesterday.day == otherDay.day && yesterday.month == otherDay.month && yesterday.year == otherDay.year && yesterday.era == otherDay.era {
                formatter.dateFormat = DateFormatter.Formats.Time12
                let theTime: String = formatter.string(from: self)
                let yesterdayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Yesterday)
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                statusString = "\(yesterdayString) \(atString) \(theTime)"
            }
            else {
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                formatter.dateFormat = "\(DateFormatter.Formats.DFMY) '\(atString)' \(DateFormatter.Formats.Time12)"
                let theTime: String = formatter.string(from: self)
                statusString = "\(theTime)"
            }
        }
        return statusString
    }
    
    public func nm_formattedTimestampDay(_ regionUTCDiff: String? = nil, isArabic: Bool) -> String {
        var statusString: String
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        if regionUTCDiff != nil {
            formatter.timeZone = TimeZone(identifier: regionUTCDiff!)
        }
        
        formatter.locale = Locale(identifier: isArabic ? LanguageManager.LocaleIdentifier.Arabic : LanguageManager.LocaleIdentifier.EnglishDate)
        
        let otherDay: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: self)
        let today: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: Date())
        if today.day == otherDay.day && today.month == otherDay.month && today.year == otherDay.year && today.era == otherDay.era {
            statusString = String.localized(key: BasicFrameworkManager.Strings.Formats.Today)
        }
        else {
            var yesterday: DateComponents = today
            yesterday.day = today.day! - 1
            if yesterday.day == otherDay.day && yesterday.month == otherDay.month && yesterday.year == otherDay.year && yesterday.era == otherDay.era {
                statusString = String.localized(key: BasicFrameworkManager.Strings.Formats.Yesterday)
            }
            else {
                formatter.dateFormat = DateFormatter.Formats.DFMYSmall
                let theTime: String = formatter.string(from: self)
                statusString = "\(theTime)"
            }
        }
        return statusString
    }
    
    public func nm_formattedTimestampMDMS(_ regionUTCDiff: String? = nil, isArabic: Bool) -> String {
        var statusString: String
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        if regionUTCDiff != nil {
            formatter.timeZone = TimeZone(identifier: regionUTCDiff!)
        }
        if isArabic {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.Arabic)
        }
        else {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.EnglishDate)
        }
        let otherDay: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: self)
        let today: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: Date())
        if today.day == otherDay.day && today.month == otherDay.month && today.year == otherDay.year && today.era == otherDay.era {
            formatter.dateFormat = DateFormatter.Formats.Time12
            let theTime: String = formatter.string(from: self)
            let todayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Today)
            let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
            statusString = "\(todayString) \(atString) \(theTime)"
        }
        else {
            var yesterday: DateComponents = today
            yesterday.day = today.day! - 1
            if yesterday.day == otherDay.day && yesterday.month == otherDay.month && yesterday.year == otherDay.year && yesterday.era == otherDay.era {
                formatter.dateFormat = DateFormatter.Formats.Time12
                let theTime: String = formatter.string(from: self)
                let yesterdayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Yesterday)
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                statusString = "\(yesterdayString) \(atString) \(theTime)"
            }
            else {
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                formatter.dateFormat = "d MMM '\(atString)' h:mm a"
                let theTime: String = formatter.string(from: self)
                statusString = "\(theTime)"
            }
        }
        return statusString
    }
    
    public func nm_formattedTimestampMDMSHourOnly(_ regionUTCDiff: String? = nil, isArabic: Bool) -> String {
        var statusString: String
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        if regionUTCDiff != nil {
            formatter.timeZone = TimeZone(identifier: regionUTCDiff!)
        }
        if isArabic {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.Arabic)
        }
        else {
            formatter.locale = Locale(identifier: LanguageManager.LocaleIdentifier.EnglishDate)
        }
        let otherDay: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: self)
        let today: DateComponents = (Calendar.current as NSCalendar).components([.era, .year, .month, .day], from: Date())
        if today.day == otherDay.day && today.month == otherDay.month && today.year == otherDay.year && today.era == otherDay.era {
            formatter.dateFormat = DateFormatter.Formats.Hour12
            let theTime: String = formatter.string(from: self)
            let todayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Today)
            let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
            statusString = "\(todayString) \(atString) \(theTime)"
        }
        else {
            var yesterday: DateComponents = today
            yesterday.day = today.day! - 1
            if yesterday.day == otherDay.day && yesterday.month == otherDay.month && yesterday.year == otherDay.year && yesterday.era == otherDay.era {
                formatter.dateFormat = "hh a"
                let theTime: String = formatter.string(from: self)
                let yesterdayString  = String.localized(key: BasicFrameworkManager.Strings.Formats.Yesterday)
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                statusString = "\(yesterdayString) \(atString) \(theTime)"
            }
            else {
                let atString = String.localized(key: BasicFrameworkManager.Strings.Formats.At)
                formatter.dateFormat = "d MMM '\(atString)' h a"
                let theTime: String = formatter.string(from: self)
                statusString = "\(theTime)"
            }
        }
        return statusString
    }
    
    public func nm_encodeForEvent() -> String {
        return Date.eventEncoder!.string(from: self)
    }
    
    /// formatted Birthday from date yyyy-MM-dd
    public func nm_formattedBD() -> String {
        let formatter: DateFormatter = DateFormatter.getDateFormatter()
        formatter.dateFormat = DateFormatter.Formats.YMD
        return formatter.string(from: self)
    }
    
    /// convert date to string full formate yyyy-MM-dd HH:mm:ss
    public func nm_date2Str() -> String {
        let formatter = DateFormatter.getFullFormatter()
        let stringFromDate = formatter.string(from: self)
        return stringFromDate
    }
    
    /// get time from date formatted
    public func nm_convertToTimeString() -> String  {
        let dateFormatter = DateFormatter.getTimeFormatter()
        return dateFormatter.string(from: self)
    }
    
    /// Get number of days between current date and the given one
    public func nm_getDifferentDays(date: Date)  -> Int    {
        
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day ?? 0
    }
    
    
}
