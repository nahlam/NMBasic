//
//  UIViewController+Utils.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/2/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    public class func topMostViewController() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate!
        let rootViewController = appDelegate.window??.rootViewController!
        return rootViewController!
    }
    
    
    public class func findBestViewController(_ vc: UIViewController) -> UIViewController {
        if (vc.presentedViewController != nil) {
            // Return presented view controller
            return UIViewController.findBestViewController(vc.presentedViewController!)
        }
        else if (vc is UISplitViewController) {
            // Return right hand side
            let svc: UISplitViewController = (vc as! UISplitViewController)
            if svc.viewControllers.count > 0 {
                return UIViewController.findBestViewController(svc.viewControllers.last!)
            }
            else {
                return vc
            }
        }
        else if (vc is UINavigationController) {
            // Return top view
            let svc: UINavigationController = (vc as! UINavigationController)
            if svc.viewControllers.count > 0 {
                return UIViewController.findBestViewController(svc.topViewController!)
            }
            else {
                return vc
            }
        }
        else if (vc is UITabBarController) {
            // Return visible view
            let svc: UITabBarController = (vc as! UITabBarController)
            if svc.viewControllers!.count > 0 {
                return UIViewController.findBestViewController(svc.selectedViewController!)
            }
            else {
                return vc
            }
        }
        else {
            // Unknown view controller type, return last child view controller
            return vc
        }
        
    }
    
    public class func currentViewController() -> UIViewController {
        // Find best view controller
        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        return UIViewController.findBestViewController(viewController)
    }
}
