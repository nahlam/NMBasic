//
//  LocaleAlignedUILabel.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

public class LocaleAlignedUILabel: LocaleKeyUILabel {

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.setAlignment()
    }
    
    public func setAlignment() {
        if self.textAlignment != .center {
            self.textAlignment = LanguageManager.shared.isArabic ? .right : .left
        }
        
    }
    
}
