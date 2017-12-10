//
//  NSString+Validations.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS
import CoreTelephony


public extension String    {
    
    public func nm_isPhone() -> Bool {
        
        let newString: String = self.replacingOccurrences(of: " ", with: "")
        let cs: CharacterSet = CharacterSet(charactersIn: "0123456789-+()").inverted
        let array:[String] =  newString.components(separatedBy: cs)
        let filtered: String = array.joined(separator: "")
        let isNumeric: Bool = (newString == filtered)
        return isNumeric
    }
    
    public func nm_isValidEmail() -> Bool {
        let emailRegex: String = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    
    public func nm_isValidMobile() -> Bool {
        
        let length:Int = self.count
        if length >= 12 && length <= 13 {
            return true
        }
        return false
    }
   
    
    public func nm_isValidContactMobile() -> Bool {
        
        let length:Int = self.count
        if length >= 10 && length <= 13 {
            return true
        }
        return false
    }
    
    
    public func nm_getPhoneWithoutCountryCode() -> String {
        
        let phoneUtil: NBPhoneNumberUtil = NBPhoneNumberUtil()
        var nationalNumber: String? = nil
        
        let countryCodeNumber: NSNumber = phoneUtil.extractCountryCode(self, nationalNumber: nil)
        let countryCode: Int = Int(countryCodeNumber.int32Value)
        print("extractCountryCode [\(countryCode)] [\(nationalNumber != nil ? nationalNumber! : "" )]")
        if nationalNumber == nil {
            let phone = try! phoneUtil.parse(self, defaultRegion: "KW")
            if let number: NSNumber  = phone.nationalNumber {
                nationalNumber = "\(number)"
            }
        }        
        return nationalNumber != nil ? nationalNumber! : ""
    }
    
    public var isNotEmpty: Bool {
        get{
            return !self.isEmpty
        }
    }
    
    public func nm_Max100()   -> String {
        var maxString = ""
        if self.count <= 100 {
            maxString = self
        }else {
            let index = self.index(self.startIndex, offsetBy: 100)
            maxString = self.substring(to: index)
        }
        return maxString
    }
}
