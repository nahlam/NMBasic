//
//  Q8TintUIImageView.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUIImageView: UIImageView {
    
    override public var image: UIImage! {
        get {
            return super.image
        }
        set {
            if newValue != nil {
                let resizedImage = newValue
                super.image = resizedImage?.withRenderingMode(.alwaysTemplate)
                super.tintColor =  UIColor.appBasic
            }
            
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image != nil    {
            
            let resizedImage = image!
            image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.appBasic
        }
    }
    
    
}
