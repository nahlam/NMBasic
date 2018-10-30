//
//  UIWindow+VisibleView.swift
//  4Sale
//
//  Created by Nahla Mortada on 7/20/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow {
    
    public func visibleViewController() -> UIViewController {
        let rootViewController: UIViewController = self.rootViewController!
        return UIWindow.getVisibleViewControllerFrom(rootViewController)
    }
    
    public class func getVisibleViewControllerFrom(_ vc: UIViewController) -> UIViewController {
        if (vc is UINavigationController) {
            return UIWindow.getVisibleViewControllerFrom((vc as! UINavigationController).visibleViewController!)
        }
        else if (vc is UITabBarController) {
            return UIWindow.getVisibleViewControllerFrom((vc as! UITabBarController).selectedViewController!)
        }
        else {
            if vc.presentedViewController != nil {
                return UIWindow.getVisibleViewControllerFrom(vc.presentedViewController!)
            }
            else {
                return vc
            }
        }
        
    }
}
