//
//  UIScreen+Dimentions.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 3/26/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
    
    public static var size: CGSize {
        let screenRect = UIScreen.main.bounds.size
        return screenRect
    }
    
    public static var width: CGFloat {
        return UIScreen.size.width
    }
    
    public static var height: CGFloat {
        return UIScreen.size.height
    }
    
}
