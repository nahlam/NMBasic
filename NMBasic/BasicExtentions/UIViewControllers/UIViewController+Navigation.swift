//
//  UIViewController.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 3/29/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit


public extension UIViewController {
    
    public func isPresentedModal() -> Bool {
        if self.presentedViewController != nil {
            return true
        }else {
            if let navigation = self.navigationController, let presenting = navigation.presentingViewController {
                if presenting.presentedViewController == self.navigationController {
                    return true
                }
            }else {
                if let tabController = self.tabBarController {
                    if tabController.presentingViewController is UITabBarController {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
