//
//  UIApplication+AppDimensions.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    public class func nm_currentSize() -> CGSize {
        return UIApplication.nm_sizeInOrientation(UIApplication.shared.statusBarOrientation)
    }
    
    public class func nm_sizeInOrientation(_ orientation: UIInterfaceOrientation) -> CGSize {
        var size: CGSize = UIScreen.main.bounds.size
        let application: UIApplication = UIApplication.shared
        if UIInterfaceOrientationIsLandscape(orientation) {
            size = CGSize(width: size.height, height: size.width)
        }
        if application.isStatusBarHidden == false {
            size.height -= min(application.statusBarFrame.size.width, application.statusBarFrame.size.height)
        }
        return size
    }
}
