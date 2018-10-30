//
//  NSArray+Shuffle.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import GameplayKit

public extension Array {
    
    public func shuffledArray() -> Array {
        
        var array:Array = Array()
        var shuffled: Array = self
        let count:Int = shuffled.count
        
        while count > 0 {
            let random:Int = Int(arc4random_uniform(UInt32(count)))
            let index: Int = random % count
            let objectToMove: Element = shuffled.remove(at: index)
            array.append(objectToMove)
        }
        return shuffled
    }
}
