//
//  UIBarButtonItem.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIBarButtonItem {
    
    public func addAccessabilityData (label: String, value: String)    {
        
        self.accessibilityTraits = UIAccessibilityTraits.button
        self.accessibilityLabel = label
    }
    
    public func changeAccessabilityValue(value: String)    {
        self.accessibilityValue = value
    }
    
    
    public class func getButton(backImage :UIImage, color :UIColor?, action: Selector) -> UIBarButtonItem {
        
        let frame:CGRect = CGRect(x: 0,y: 5, width: 25,height: 25)
        var image = backImage
        if color != nil {
            image = backImage.nm_tint(color: color!)
        }
        
        
        let button :UIButton = UIButton(frame: frame)
        button.setBackgroundImage(image, for: UIControl.State())
        button.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
        button.showsTouchWhenHighlighted = true
        let backButton:UIBarButtonItem = UIBarButtonItem(customView:button)
        backButton.isAccessibilityElement = true
        button.isAccessibilityElement = false
        return backButton
    }
    
}
