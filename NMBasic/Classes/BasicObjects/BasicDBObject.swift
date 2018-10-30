//
//  BasicDBObject.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import SwiftyJSON

open class BasicDBObject: NSObject {
 
    public struct InConstants {
        public static let Id                           = "id"
        public static let RegionId                     = "region_id"
        public static let IsActive                     = "is_active"
    }
    
    // MARK: - Variables
    public var isActive: Bool
    public var ID: Int
    public var regionId: Int
    
    // MARK: - Initalization Methods
    
    
    public init(id: Int = 0, regionId: Int = 1, isActive: Bool = true)  {
        self.ID = id
        self.regionId = regionId
        self.isActive = isActive
        super.init()
    }
    
    public init(json: JSON) {
        
        isActive = json[InConstants.IsActive].intValue > 0
        ID = json[BasicDBObject.InConstants.Id].intValue
        regionId = json[BasicDBObject.InConstants.RegionId].intValue
        super.init()
        self.setJSONData(json: json)
    }
    
    open func setJSONData(json: JSON) {
        
    }
    
    
    open class func classString() -> String {
        return String(describing: type(of: BasicObject.self))
    }
    
    // MARK: - DB Methods
    
    open class func getDBStatment(json: JSON) -> String {
        let isActive:Bool = json[InConstants.IsActive].intValue > 0
        if isActive {
            return BasicObject.getInsertDBStatment(json: json)
        }else   {
            return BasicObject.getDeleteDBStatment(json: json)
        }
        
    }
    
    open class func getDeleteDBStatment(json: JSON) -> String {
        return ""
    }
    
    open class func getInsertDBStatment(json: JSON) -> String {
        return ""
    }
    
}
