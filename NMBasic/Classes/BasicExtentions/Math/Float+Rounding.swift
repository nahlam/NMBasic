//
//  Float+Rounding.swift
//  NMBasic
//
//  Created by Nahla Mortada on 3/14/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Float {
    
    public func roundUp() ->  Int  {
        return Int(self.rounded(.up))
    }
}
