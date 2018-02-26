//
//  LocaleKeyUILabel.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 10/25/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class LocaleKeyUILabel: UILabel {
    
    @IBInspectable public var titleKey: String = ""
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.text = String.localized(key: self.titleKey)
        self.accessibilityLabel = String.localized(key: self.titleKey)
    }
}
