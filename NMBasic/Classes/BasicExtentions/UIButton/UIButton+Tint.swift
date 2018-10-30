//
//  UIButton+Tint.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    public func nm_tint(color: UIColor) {
        let tintedImage:UIImage? = self.imageView?.image?.nm_tint(color: color)
        if tintedImage != nil {
            self.imageView?.image = tintedImage
            self.setImage(self.imageView?.image, for: UIControl.State())
        }
        
        self.tintColor = color
    }
    
    public func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}
