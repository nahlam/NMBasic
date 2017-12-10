//
//  AlignedLabel.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class VerticalAlignLabel: LocaleKeyUILabel {
    
    public enum VerticalAlignment : Int {
        case verticalAlignmentTop = 0
        case verticalAlignmentMiddle = 1
        case verticalAlignmentBottom = 2
    }
    
    public var verticalAlignment : VerticalAlignment = .verticalAlignmentTop {
        didSet {
            setNeedsDisplay()
        }
    }
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines: Int) -> CGRect {
        
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        
        switch(verticalAlignment) {
        case .verticalAlignmentTop:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
        case .verticalAlignmentMiddle:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
        case .verticalAlignmentBottom:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
        }
    }
    
    override public func drawText(in rect: CGRect) {
        let r = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: r)
    }
}
