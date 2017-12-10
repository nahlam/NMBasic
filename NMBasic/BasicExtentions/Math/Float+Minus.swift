//
//  Float+Minus.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 4/4/17.
//  Copyright © 2017 Technivance. All rights reserved.
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
