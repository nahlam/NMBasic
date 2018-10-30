//
//  UIView+Round.swift
//  4Sale
//
//  Created by Nahla Mortada on 7/13/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import UIKit

public extension UIView    {
    
    public func nm_roundedView() {
        nm_rounded(radius: self.bounds.size.width/2)
    }
    
    public func nm_roundedViewBasicBorderColor() {
        nm_rounded(radius: self.bounds.size.width/2, borderWidth: 0.3, color: UIColor.lightGray)
    }
    
    
    public func nm_rounded(radius:CGFloat) {
        nm_rounded(radius: radius, borderWidth: 0, color: nil)
    }
    
    public func nm_rounded(width:CGFloat, color:UIColor) {
        nm_rounded(radius: self.bounds.height/2, borderWidth: width, color: color)
    }
    
    public func nm_border(borderWidth:CGFloat, color:UIColor) {
        nm_rounded(radius: 0, borderWidth: 0, color: color)
    }
    
    public func nm_rounded(radius:CGFloat, borderWidth:CGFloat, color:UIColor?) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color?.cgColor
    }
    
    public func nm_roundedTopCorner(radius:CGFloat, bounds:CGRect) {
        
        nm_roundedCorners(radius: radius, bounds: bounds, corners: [UIRectCorner.topLeft , UIRectCorner.topRight])
    }
    
    public func nm_roundedBottomCorner(radius:CGFloat, bounds:CGRect) {
        nm_roundedCorners(radius: radius, bounds: bounds, corners: [UIRectCorner.bottomLeft , UIRectCorner.bottomRight])
    }
    
    public func nm_roundedCorners(radius: CGFloat, bounds:CGRect, corners: UIRectCorner) {
        
        let maskPath:UIBezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer:CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.cgPath;
        self.layer.mask = maskLayer;
    }    
}
