//
//  TintedRoundBorderLocaleUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedRoundBorderLocaleUIButton: LocaleKeyUIButton {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = self.isEnabled ? UIColor.appBasic : UIColor.lightGrey30
        self.nm_rounded(radius: 5)
    }
    
    override open func enable(bool: Bool)   {
        self.tintColor =  bool ? UIColor.appBasic : UIColor.lightGrey30
        self.backgroundColor = bool ? UIColor.appBasic : UIColor.lightGrey30
    }
    
}
