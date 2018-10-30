//
//  RoundedEdgesColoredUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/11/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedEdgesColoredUIView: UIView {
    
    @IBInspectable open var radiusColor: UIColor?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.nm_rounded(radius: 5, borderWidth: 1, color: radiusColor)
    }
}
