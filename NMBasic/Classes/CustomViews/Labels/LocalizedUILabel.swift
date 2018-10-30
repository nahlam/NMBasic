//
//  LocalizedUILabel.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

open class LocalizedUILabel: LocaleKeyUILabel {

    override open func awakeFromNib() {
        super.awakeFromNib()
        self.setAlignment()
    }
    
    open func setAlignment() {
        
        if self.textAlignment == .right {
            self.textAlignment = LanguageManager.shared.isArabic ? .left : .right
        }
        else if self.textAlignment != .center {
            self.textAlignment = LanguageManager.shared.isArabic ? .right : .left
        }
        
        if LanguageManager.shared.isArabic {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
}
