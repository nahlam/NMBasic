//
//  UIColor+Common.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 10/25/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor   {
    
    public class var lightGrey70: UIColor {
        return UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.7)
    }
    
    public class var lightGrey30: UIColor {
        return UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.3)
    }
    
    public class var lightGrey50: UIColor {
        return UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.5)
    }
    
    public class var lightGrey10: UIColor {
        return UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.1)
    }
    
    public class var lightGrey20: UIColor {
        return UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 0.2)
    }
    
    public class var customLightGrey: UIColor {
        return UIColor(red: 216.0 / 255, green: 219.0 / 255, blue: 219.0 / 255, alpha: 1.0)
    }
    
    public class var customVeryLightGrey: UIColor {
        return UIColor(red: 244.0 / 255, green: 244.0 / 255, blue: 244.0 / 255, alpha: 1.0)
    }
    
    public class var appBasic: UIColor {
        return BasicFrameworkManager.shared.basicColor ?? UIColor.black
    }
    
    public class var customRedColor: UIColor {
        return UIColor.red
    }
    
    public class var customOrangeColor: UIColor {
        return UIColor.orange
    }
    
    public class var customOrangeColor50: UIColor {
        return UIColor(red: 255.0 / 255, green: 128.0 / 255, blue: 0.0 / 255, alpha: 0.5)
    }
    
    public class var customRedColor50: UIColor {
        return UIColor(red: 255.0 / 255, green: 0.0 / 255, blue: 0.0 / 255, alpha: 0.5)
    }
    
    public class var customGreenColor: UIColor {
        return UIColor(red: 70.0 / 255, green: 167.0 / 255, blue: 93.0 / 255, alpha: 1.0)
    }
    
    
    convenience public init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience public init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience public init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
