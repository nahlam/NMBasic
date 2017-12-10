//
//  Double+Round.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 1/20/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Rounds the double to decimal places value
    
    public func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
