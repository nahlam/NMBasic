//
//  TintedUIButton.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/25/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedBGUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        self.setBackgroundColor(color: UIColor.appBasic, forState: UIControl.State())
        self.setBackgroundColor(color: UIColor.lightGray, forState: UIControl.State.disabled)
        setTitleColor(UIColor.white, for: UIControl.State())
    }
}
