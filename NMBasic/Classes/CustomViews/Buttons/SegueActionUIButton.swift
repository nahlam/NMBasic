//
//  SegueActionUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/29/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class SegueActionUIButton: UIButton {
    
    @IBInspectable open var isPerformSegue: Bool = false
    @IBInspectable open var action: String = ""
    
}
