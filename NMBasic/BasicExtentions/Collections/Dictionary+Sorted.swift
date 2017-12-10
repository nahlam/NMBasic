//
//  Dictionary+Sorted.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 1/16/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation

public enum FolderOrder {
    case AlphaAtoZ
    case AlphaZtoA
    case SizeLargeToSmall
    case SizeSmallToLarge
}


public extension Dictionary {
    
    public func sortedKeys(isOrderedBefore:(Key,Key) -> Bool) -> [Key] {
        return Array(self.keys).sorted(by: isOrderedBefore)
    }
    
    // Slower because of a lot of lookups, but probably takes less memory (this is equivalent to Pascals answer in an generic extension)
    public func sortedKeysByValue(isOrderedBefore:(Value, Value) -> Bool) -> [Key] {
        return sortedKeys {
            isOrderedBefore(self[$0]!, self[$1]!)
        }
    }
    
    // Faster because of no lookups, may take more memory because of duplicating contents
    public func keysSortedByValue(isOrderedBefore:(Value, Value) -> Bool) -> [Key] {
        return Array(self)
            .sorted() {
                let (_, lv) = $0
                let (_, rv) = $1
                return isOrderedBefore(lv, rv)
            }
            .map {
                let (k, _) = $0
                return k
        }
    }
    
}
