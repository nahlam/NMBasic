//
//  Q8UISegmentControl.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 2/19/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUISegmentedControl: UISegmentedControl {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        for subViewOfSegment: UIView in subviews {
            subViewOfSegment.tintColor = UIColor.appBasic
        }
    }
}
