//
//  UITabBarController+Orientation.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/2/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UITabBarController {
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override open var shouldAutorotate : Bool {
        return false
    }
}
