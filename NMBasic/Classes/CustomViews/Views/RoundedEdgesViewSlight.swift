//
//  RoundedEdgesUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedEdgesUIViewSlight: UIView {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        nm_rounded(radius: 5, borderWidth: 0, color: nil)
    }
}
