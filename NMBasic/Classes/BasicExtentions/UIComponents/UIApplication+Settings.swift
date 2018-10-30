//
//  UIApplication+Settings.swift
//  NMBasic
//
//  Created by Nahla Mortada on 2/23/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

import UIKit

public extension UIApplication {
    
    public static func isNotificationEnabled() -> Bool {
        if UIApplication.shared.currentUserNotificationSettings != nil {
            return true
        }
        return false
    }
}
