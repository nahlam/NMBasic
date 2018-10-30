//
//  Float+Minus.swift
//  NMBasic
//
//  Created by Nahla Mortada on 4/4/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Float {
    
    public func getItAsPositive() ->  Float  {
        if self < 0 {
            return (self * -1.0)
        }
        return self
    }
}
