//
//  Q8UINavigationItem.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/27/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUINavigationBar: UINavigationBar  {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        tintColor =  UIColor.appBasic
    }
}
