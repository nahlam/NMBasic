//
//  NSObject+Nullability.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension NSObject  {
    
    public class func isNotNull(_ object:Any?) -> Bool {
        guard let object = object else {
            return false
        }
        return (isNotNSNull(object) && isNotStringNull(object: object))
    }
    
    public class func isNotNSNull(_ object:Any) -> Bool {
        let anyObject = object as AnyObject
        return anyObject.classForCoder != NSNull.classForCoder()
    }
    
    public class func isNotStringNull(_ object:Any) -> Bool {
        
        let anyObject = object as AnyObject
        
        if let string = anyObject as? String {
            if string.uppercased() == "NULL"{
                return false
            }
        }
        return true
    }
}
