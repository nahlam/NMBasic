//
//  TintedUIPlaceHolderTextView.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/8/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUIPlaceHolderTextView: KMPlaceholderTextView {
    
    @IBInspectable public var placeholderKey: String = ""
    public var maxLenght = 1000
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.placeholder = String.localized(key: self.placeholderKey)
        self.accessibilityLabel = String.localized(key: self.placeholderKey)
    }
    
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
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
