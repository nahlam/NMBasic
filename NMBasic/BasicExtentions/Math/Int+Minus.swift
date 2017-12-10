//
//  Int+Minus.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 3/15/17.
//  Copyright © 2017 Technivance. All rights reserved.
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
