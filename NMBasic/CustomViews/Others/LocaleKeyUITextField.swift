//
//  LocaleKeyUITextField.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class LocaleKeyUITextField: UITextField {
    
    @IBInspectable public var placeholderKey: String = ""
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.placeholder = String.localized(key: self.placeholderKey)
        self.accessibilityLabel = String.localized(key: self.placeholderKey)
    }
    
}
