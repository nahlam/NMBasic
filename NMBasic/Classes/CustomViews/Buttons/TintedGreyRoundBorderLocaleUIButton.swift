//
//  TintedGreyBorderLocaleButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedGreyRoundBorderLocaleUIButton: LocaleKeyUIButton {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.setTitleColor(self.isEnabled ? UIColor.appBasic :  UIColor.lightGrey50, for: .normal)
        self.nm_rounded(radius: 5, borderWidth: 1, color: UIColor.lightGrey30)
    }
    
    
    override open func enable(bool: Bool)   {
        self.setTitleColor(self.isEnabled ? UIColor.appBasic :  UIColor.lightGrey50, for: .normal)
    }
}
