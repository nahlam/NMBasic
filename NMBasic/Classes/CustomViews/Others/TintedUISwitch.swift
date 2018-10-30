//
//  TintedUISwitch.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/2/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUISwitch: UISwitch {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        onTintColor = UIColor.appBasic
    }
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        onTintColor = UIColor.appBasic
    }
}
