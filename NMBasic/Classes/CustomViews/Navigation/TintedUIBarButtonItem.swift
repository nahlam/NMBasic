//
//  TintedUIBarButtonItem.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/27/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUIBarButtonItem: UIBarButtonItem {
    
    required public init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)!
        tintColor =  UIColor.appBasic
    }
}
