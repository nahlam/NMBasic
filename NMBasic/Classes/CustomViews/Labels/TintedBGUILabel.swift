//
//  Q8LabelWithBGColor.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/11/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedBGUILabel: LocaleKeyUILabel {
    
    required public init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)!
        backgroundColor = UIColor.appBasic
        textColor = UIColor.white
    }
}
