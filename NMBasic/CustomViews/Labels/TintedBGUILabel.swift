//
//  Q8LabelWithBGColor.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/11/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedBGUILabel: LocaleKeyUILabel {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        backgroundColor = UIColor.appBasic
        textColor = UIColor.white
    }
}
