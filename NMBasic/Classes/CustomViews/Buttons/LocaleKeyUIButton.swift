//
//  LocaleKeyUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/29/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization


open class LocaleKeyUIButton: UIButton {
    
    @IBInspectable open var titleKey: String = ""
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        if !titleKey.isEmpty    {
            self.setTitle(String.localized(key: self.titleKey), for: .normal)
            self.accessibilityLabel = String.localized(key: self.titleKey)
        }
    }
    
    open func enable(bool: Bool)   {
        
    }
    
    open func setAccessibility(label: String, hint: String)    {
        self.accessibilityLabel = String.localized(key: label)
        self.accessibilityHint = String.localized(key: hint)
    }
    
    open func setAccessibilityLabel(localeKey: String)    {
        self.accessibilityLabel = String.localized(key: localeKey)
    }
    
    open func setAccessibilityHint(localeKey: String)    {
        self.accessibilityHint = String.localized(key: localeKey)
    }
}
