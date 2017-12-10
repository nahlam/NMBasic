//
//  TintedNoGreyUIButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 8/23/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedNoGreyUIButton: LocaleKeyUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        setTitleColor(UIColor.appBasic, for: UIControlState.disabled)
        setTitleColor(UIColor.appBasic, for: .normal)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.appBasic, for: UIControlState.disabled)
        setTitleColor(UIColor.appBasic, for: .normal)
    }
}
