//
//  TintedUISwitch.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/2/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUISwitch: UISwitch {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        onTintColor = UIColor.appBasic
    }
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        onTintColor = UIColor.appBasic
    }
}
