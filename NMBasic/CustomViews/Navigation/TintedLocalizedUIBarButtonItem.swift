//
//  TintedLocalizedUIBarButtonItem.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 2/22/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit

class TintedLocalizedUIBarButtonItem: TintedUIBarButtonItem {

    @IBInspectable public var titleKey: String = ""
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.title = String.localized(key: self.titleKey)
        self.accessibilityLabel = String.localized(key: self.titleKey)
    }
}
