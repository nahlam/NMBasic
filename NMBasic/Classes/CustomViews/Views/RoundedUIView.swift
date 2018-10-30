//
//  Q8RoundedView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedUIView: UIView {
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        nm_roundedView()
    }
    
}
