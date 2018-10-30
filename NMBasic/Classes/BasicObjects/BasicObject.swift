//
//  BasicObject.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import SwiftyJSON
import GeneralLocalization

open class BasicObject: BasicDBObject {
    
    public struct InConstants {
        public static let EnglishName                  = "name_en"
        public static let EnglishTitle                 = "title_en"
        public static let EnglishLabel                 = "label_en"
        public static let ArabicName                   = "name_ar"
        public static let ArabicTitle                  = "title_ar"
        public static let ArabicLabel                  = "label_ar"
    }
    
    // MARK: - Variables
    public var arabicName: String
    public var englishName: String
    
    public var name: String    {
        if LanguageManager.shared.isEnglish , self.englishName.isEmpty == false {
            return self.englishName
        }
        if LanguageManager.shared.isArabic, self.arabicName.isEmpty == false {
            return self.arabicName
        }
        return ""
    }
    
    
    // MARK: - Initalization Methods
    
    public init(id: Int, regionId: Int = BasicFrameworkManager.defaultRegionId, arName: String, enName: String) {
        arabicName = arName
        englishName = enName
        super.init(id: id, regionId: regionId)
    }
    
    public init()  {
        arabicName = ""
        englishName = ""
        super.init()
    }
    
    override public init(json: JSON) {
        
        var englishNameDB: String = json[BasicObject.InConstants.EnglishName].stringValue.replacingOccurrences(of: "%27", with: "'")
        var arabicNameDB: String = json[BasicObject.InConstants.ArabicName].stringValue.replacingOccurrences(of: "%27", with: "'")
        
        var isEmpty = englishNameDB.isEmpty && arabicNameDB.isEmpty
        if isEmpty {
            englishNameDB = json[BasicObject.InConstants.EnglishTitle].stringValue.replacingOccurrences(of: "%27", with: "'")
            arabicNameDB = json[BasicObject.InConstants.ArabicTitle].stringValue.replacingOccurrences(of: "%27", with: "'")
        }
        
        isEmpty = englishNameDB.isEmpty && arabicNameDB.isEmpty
        if isEmpty {
            englishNameDB = json[BasicObject.InConstants.EnglishLabel].stringValue.replacingOccurrences(of: "%27", with: "'")
            arabicNameDB = json[BasicObject.InConstants.ArabicLabel].stringValue.replacingOccurrences(of: "%27", with: "'")
        }
        
        arabicName = arabicNameDB
        englishName = englishNameDB
        super.init(json: json)
        self.setJSONData(json: json)
    }
    
    
    override open func setJSONData(json: JSON) {
        super.setJSONData(json: json)
    }
    
    
}
