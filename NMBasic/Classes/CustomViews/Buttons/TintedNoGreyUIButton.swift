//
//  TintedNoGreyUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/23/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedNoGreyUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.appBasic, for: UIControl.State.disabled)
        setTitleColor(UIColor.appBasic, for: .normal)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.appBasic, for: UIControl.State.disabled)
        setTitleColor(UIColor.appBasic, for: .normal)
    }
}
