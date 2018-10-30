//
//  MutableCollection+Shuffle.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/19/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation

public extension MutableCollection where Index == Int {
    
    mutating public func shuffled() {
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}
