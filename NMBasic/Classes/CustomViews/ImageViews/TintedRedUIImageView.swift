//
//  Q8TintRedUIImageView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedRedUIImageView: UIImageView {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image != nil    {
            
            let resizedImage = image!
            image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.red
        }
    }
    
    override open var image: UIImage! {
        get {
            return super.image
        }
        set {
            
            let resizedImage = newValue!
            super.image = resizedImage.withRenderingMode(.alwaysTemplate)
            super.tintColor =  UIColor.red
        }
    }
}
