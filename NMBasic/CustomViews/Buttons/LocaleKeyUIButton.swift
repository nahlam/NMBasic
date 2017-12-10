//
//  LocaleKeyUIButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 8/29/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization


public class LocaleKeyUIButton: UIButton {
    
    @IBInspectable public var titleKey: String = ""
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        if !titleKey.isEmpty    {
            self.setTitle(String.localized(key: self.titleKey), for: .normal)
            self.accessibilityLabel = String.localized(key: self.titleKey)
        }
    }
    
    public func enable(bool: Bool)   {
        
    }
    
    public func setAccessibility(label: String, hint: String)    {
        self.accessibilityLabel = String.localized(key: label)
        self.accessibilityHint = String.localized(key: hint)
    }
    
    public func setAccessibilityLabel(localeKey: String)    {
        self.accessibilityLabel = String.localized(key: localeKey)
    }
    
    public func setAccessibilityHint(localeKey: String)    {
        self.accessibilityHint = String.localized(key: localeKey)
    }
}
