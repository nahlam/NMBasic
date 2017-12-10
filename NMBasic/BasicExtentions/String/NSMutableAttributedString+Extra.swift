//
//  NSMutableAttributedString+Bold.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 2/23/17.
//  Copyright © 2017 Kidstoriz. All rights reserved.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
    
    public func appendCustom(_ text:String, font: UIFont) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : font]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        return self
    }
    
    public func appendNormal(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
    
    public func setBold(_ array: [String] , font: UIFont) {
        let attrs:[String:AnyObject] = [NSFontAttributeName : font]
        for string in array {
            let fullString: NSString = self.string as NSString
            self.addAttributes(attrs, range: fullString.range(of: string))
        }
    }
    
    public func appendWithColor(_ text:String, color: UIColor)->NSMutableAttributedString {
        
        let attrs:[String:AnyObject] = [NSForegroundColorAttributeName : color]
        let colored =  NSMutableAttributedString(string: text)
        let fullString: NSString = text as NSString
        let range = fullString.range(of: text)
        colored.addAttributes(attrs, range: range)
        self.append(colored)
        return self
    }
}
