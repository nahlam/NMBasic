//
//  TintedUIButton.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/25/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.gray, for: UIControl.State.disabled)
        setTitleColor(UIColor.appBasic, for: UIControl.State())
    }

    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        setTitleColor(UIColor.gray, for: UIControl.State.disabled)
        setTitleColor(UIColor.appBasic, for: UIControl.State())
    }
}
