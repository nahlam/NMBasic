//
//  RoundedTopEdgesUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedTopEdgesUIView: UIView {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.nm_roundedTopCorner(radius: 5, bounds: self.bounds)
    }
}
