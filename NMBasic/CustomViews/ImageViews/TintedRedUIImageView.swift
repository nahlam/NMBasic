//
//  Q8TintRedUIImageView.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 10/23/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedRedUIImageView: UIImageView {
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image != nil    {
            
            let resizedImage = image!
            image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.red
        }
    }
    
    override public var image: UIImage! {
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
