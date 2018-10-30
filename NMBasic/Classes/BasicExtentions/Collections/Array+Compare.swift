//
//  Array+Compare.swift
//  NMBasic
//
//  Created by Nahla Mortada on 2/28/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit

public extension Array where Element: Comparable {
    
    public func containsSameElements(as other: [Element]) -> Bool {
        
        return self.count == other.count && self.sorted() == other.sorted()
    }
}

