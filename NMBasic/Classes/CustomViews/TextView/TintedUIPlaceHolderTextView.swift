//
//  TintedUIPlaceHolderTextView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/8/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUIPlaceHolderTextView: KMPlaceholderTextView {
    
    @IBInspectable open var placeholderKey: String = ""
    open var maxLenght = 1000
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.placeholder = String.localized(key: self.placeholderKey)
        self.accessibilityLabel = String.localized(key: self.placeholderKey)
    }
    
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:))   {
            let pasteboardString = UIPasteboard.general.string
            let descriptionText = self.text
            if (descriptionText?.count ?? 0) + (pasteboardString?.count ?? 0) > maxLenght {
                return false
            }
            return true
        }
        return super.canPerformAction(action,withSender:sender)
    }
    
}
