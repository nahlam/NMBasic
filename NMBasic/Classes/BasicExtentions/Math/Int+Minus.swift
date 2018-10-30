//
//  Int+Minus.swift
//  NMBasic
//
//  Created by Nahla Mortada on 3/15/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Int {
    
    public func getItAsPositive() ->  Int  {
        if self < 0 {
            return (self * -1)
        }
        return self
    }
}
