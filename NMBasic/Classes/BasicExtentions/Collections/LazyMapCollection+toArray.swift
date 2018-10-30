//
//  LazyMapCollection+toArray.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/24/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension LazyMapCollection  {
    
    public func toArray() -> [Element]  {
        
        return Array(self)
    }
}
