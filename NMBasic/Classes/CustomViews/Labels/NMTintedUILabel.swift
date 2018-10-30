//
//  NMTintedUILabel.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 12/3/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class NMTintedUILabel: TintedUILabel {

    open func enable(bool: Bool)  {
        textColor = bool ? UIColor.appBasic : UIColor.lightGrey30
    }
    
}
