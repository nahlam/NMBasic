//
//  Q8TintResizedUIImageView.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/8/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import AlamofireImage

public class TintedResizedUIImageView: UIImageView {
    
    override public var image: UIImage! {
        get {
            return super.image
        }
        set {
            if image != nil {
                let resizedImage = newValue!.af_imageScaled(to: self.frame.size)
                super.image = resizedImage.withRenderingMode(.alwaysTemplate)
                super.tintColor =  UIColor.appBasic
            }
            
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image != nil    {
            
            let resizedImage = image!.af_imageScaled(to: self.frame.size)
            image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.appBasic
        }
    }
    
    public func resize ()  {
        if image != nil {
            DispatchQueue.global(qos: .background).async {
                let resizedImage = self.image!.af_imageScaled(to: self.frame.size)
                DispatchQueue.main.async {
                    self.image = resizedImage
                }
            }
            
        }
    }
}
