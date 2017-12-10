//
//  Int+Check.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 12/12/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation

public extension Int {
    
    public func isEven() -> Bool {
        if self % 2 == 0 {
            return true
        }
        return false
    }
    
    public func isOdd ()  -> Bool {
        if self % 2 != 0 {
            return true
        }
        return false
    }
}
