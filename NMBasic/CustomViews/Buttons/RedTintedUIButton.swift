//
//  UIRedTintedButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class RedTintedUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        setTitleColor(UIColor.red, for: UIControlState())
    }
}
