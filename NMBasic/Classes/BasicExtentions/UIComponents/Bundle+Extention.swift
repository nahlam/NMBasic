//
//  Bundle+Extention.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/29/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation


public extension Bundle {
    
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
