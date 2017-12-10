//
//  TintedUIButton.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/25/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedBGUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        self.setBackgroundColor(color: UIColor.appBasic, forState: UIControlState())
        self.setBackgroundColor(color: UIColor.lightGray, forState: UIControlState.disabled)
        setTitleColor(UIColor.white, for: UIControlState())
    }
}
