//
//  TintedLocalizedUIBarButtonItem.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 2/22/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit

open class TintedLocalizedUIBarButtonItem: TintedUIBarButtonItem {

    @IBInspectable open var titleKey: String = ""
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.title = String.localized(key: self.titleKey)
        self.accessibilityLabel = String.localized(key: self.titleKey)
    }
}
