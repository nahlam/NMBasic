//
//  Q8TintResizedUIImageView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/8/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import Kingfisher

open class TintedResizedUIImageView: UIImageView {
    
    override open var image: UIImage! {
        get {
            return super.image
        }
        set {
            if image != nil {
                
                let resizedImage = newValue!.kf.scaled(to: self.frame.size.width)
                super.image = resizedImage.withRenderingMode(.alwaysTemplate)
                super.tintColor =  UIColor.appBasic
            }
            
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image != nil    {
            
            let resizedImage = image!.kf.scaled(to: self.frame.size.width)
            image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.appBasic
        }
    }
    
    open func resize ()  {
        if image != nil {
            DispatchQueue.global(qos: .background).async {
                let resizedImage = self.image!.kf.scaled(to: self.frame.size.width)
                DispatchQueue.main.async {
                    self.image = resizedImage
                }
            }
            
        }
    }
}
