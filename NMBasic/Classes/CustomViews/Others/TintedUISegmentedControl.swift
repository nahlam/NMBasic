//
//  Q8UISegmentControl.swift
//  NMBasic
//
//  Created by Nahla Mortada on 2/19/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUISegmentedControl: UISegmentedControl {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        for subViewOfSegment: UIView in subviews {
            subViewOfSegment.tintColor = UIColor.appBasic
        }
    }
}
