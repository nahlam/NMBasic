//
//  Bundle.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Bundle    {
    
    public class func getBundleId () -> String     {
        
        let mainBundle: Bundle = Bundle.main
        let bundleIdentifier: String? = mainBundle.bundleIdentifier
        let bundleID: String = bundleIdentifier != nil ? bundleIdentifier! : ""
        return bundleID
    }
    
    public class func appName() -> String {
        
        if  let infoDictionary = Bundle.main.infoDictionary {
            let bundleName = kCFBundleNameKey as String
            let appName:String = infoDictionary[bundleName] as! String
            return appName
        }
        return ""
        
    }
    
    public class func appVersion() -> String {
        return appMajorVersionString()
    }
    
    public class func appMajorVersionString() -> String {
        
        if let majorVersion:String = Bundle.main.releaseVersionNumber   {
            return majorVersion
        }
        return ""
    }
    
    public class func appMinorVersionString() -> String {
        
        if let majorVersion:String = Bundle.main.buildVersionNumber   {
            return majorVersion
        }
        return ""
    }
    
    
}
