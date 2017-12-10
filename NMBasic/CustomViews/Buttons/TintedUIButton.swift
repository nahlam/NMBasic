//
//  TintedUIButton.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/25/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.gray, for: UIControlState.disabled)
        setTitleColor(UIColor.appBasic, for: UIControlState())
    }

    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        setTitleColor(UIColor.gray, for: UIControlState.disabled)
        setTitleColor(UIColor.appBasic, for: UIControlState())
    }
}
