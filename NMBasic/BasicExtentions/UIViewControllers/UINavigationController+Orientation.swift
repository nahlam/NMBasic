//
//  UINavigationController+Orientation.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/2/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override open var shouldAutorotate : Bool {
        return false
    }
}
