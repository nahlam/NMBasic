//
//  TintedRoundBorderLocaleUIButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

//DONE
import Foundation

import UIKit

public class TintedRoundBorderLocaleUIButton: LocaleKeyUIButton {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = self.isEnabled ? UIColor.appBasic : UIColor.lightGrey30
        self.nm_rounded(radius: 5)
    }
    
    override public func enable(bool: Bool)   {
        self.tintColor =  bool ? UIColor.appBasic : UIColor.lightGrey30
        self.backgroundColor = bool ? UIColor.appBasic : UIColor.lightGrey30
    }
    
}
