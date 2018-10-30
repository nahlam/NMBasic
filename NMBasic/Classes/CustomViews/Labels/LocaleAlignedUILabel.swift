//
//  LocaleAlignedUILabel.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

open class LocaleAlignedUILabel: LocaleKeyUILabel {

    override open func awakeFromNib() {
        super.awakeFromNib()
        self.setAlignment()
    }
    
    open func setAlignment() {
        if self.textAlignment != .center {
            self.textAlignment = LanguageManager.shared.isArabic ? .right : .left
        }
    }
}
