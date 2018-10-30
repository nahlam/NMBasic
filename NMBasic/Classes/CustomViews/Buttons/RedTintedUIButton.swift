//
//  UIRedTintedButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RedTintedUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.lightGray, for: UIControl.State.disabled)
        setTitleColor(UIColor.red, for: UIControl.State())
    }
}
