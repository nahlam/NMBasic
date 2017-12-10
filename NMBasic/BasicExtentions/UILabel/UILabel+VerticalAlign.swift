//
//  UILabel+VerticalAlign.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
    
    public func alignTop() {
        let boundingRectSize: CGSize = CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let attributes: [String : AnyObject] = [NSFontAttributeName: self.font]
        
        let labelSize: CGRect = self.text!.boundingRect(with: boundingRectSize, options: [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.usesFontLeading], attributes: attributes, context: nil)
        let height:Float = Float(labelSize.size.height)
        let lineHeight:Float = Float(self.font.lineHeight)
        let numberOfLines: Float = Float(ceilf(height / lineHeight))
        var newFrame: CGRect = self.frame
        let finalHeight: Float = numberOfLines * lineHeight;
        newFrame.size.height = CGFloat(finalHeight)
        self.frame = newFrame
    }
    
    public func alignBottom() {
        let boundingRectSize: CGSize = CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let attributes: [String : AnyObject] = [NSFontAttributeName: self.font]
        
        let labelSize: CGRect = self.text!.boundingRect(with: boundingRectSize, options: [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.usesFontLeading], attributes: attributes, context: nil)
        let height:Float = Float(labelSize.size.height)
        let lineHeight:Float = Float(self.font.lineHeight)
        let numberOfLines: Float = Float(ceilf(height / lineHeight))
        
        let finalHeight = height / lineHeight
        let numberOfNewLined: Int = Int(finalHeight) - Int(numberOfLines)
        var newLines: String = String()
        for _ in 0..<numberOfNewLined {
            newLines += "\n"
        }
        newLines += self.text!
        self.text = newLines
    }
}
