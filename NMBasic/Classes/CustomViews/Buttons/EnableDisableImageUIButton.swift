//
//  EnableDisableImageUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/6/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class EnableDisableImageUIButton: LocaleKeyUIButton {
    
    @IBInspectable open var enableImageName: String = ""
    @IBInspectable open var disableImageName: String = ""
    
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.setImage(UIImage(named: enableImageName), for: .normal)
        self.setImage(UIImage(named: disableImageName), for: .selected)
    }
    
}
