//
//  LocaleKeyUITextField.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class LocaleKeyUITextField: UITextField {
    
    @IBInspectable open var placeholderKey: String = ""
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.placeholder = String.localized(key: self.placeholderKey)
        self.accessibilityLabel = String.localized(key: self.placeholderKey)
    }
    
}
