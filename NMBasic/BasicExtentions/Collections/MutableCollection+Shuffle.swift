//
//  MutableCollection+Shuffle.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/19/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation


public extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating public func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}
