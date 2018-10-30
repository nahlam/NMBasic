//
//  UIView+NIB.swift
//  4Sale
//
//  Created by Nahla Mortada on 2/22/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension UIView {
    
    public class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    public class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }
    
    public class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibFileName
        }
        
        if let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) {
            for nibView in nibViews {
                if let tog = nibView as? T {
                    view = tog
                }
            }
        }
        
        return view
    }
    
    public class var nibFileName: String {
        return "\(self)".components(separatedBy: ".").first ?? ""
    }
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibFileName, ofType: "nib") {
            return UINib(nibName: nibFileName, bundle: nil)
        } else {
            return nil
        }
    }
}
