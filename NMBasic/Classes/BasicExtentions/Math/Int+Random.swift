//
//  Int+Random.swift
//  NMBasic
//
//  Created by Nahla Mortada on 3/14/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Int {
    
    public func randomIntTo(to end: Int) -> Int {
        var a = self
        var b = end
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
}
