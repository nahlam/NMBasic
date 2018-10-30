//
//  RoundedUIImageView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/17/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedUIImageView: UIImageView {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        nm_roundedView()
    }
    
}
