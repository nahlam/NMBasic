//
//  ImageButtonUIView.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 11/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class ImageButtonUIView: UIView {
    
    @IBOutlet weak open var button: TintedUIButton!
    @IBOutlet weak open var image: TintedUIImageView!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        if self.image.image != nil    {
            let resizedImage = image.image!
            image.image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.appBasic
        }
    }
    
    open func enable()   {
        enable(bool: true)
    }
    
    open func disable()   {
        enable(bool: false)
    }
    
    open func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }
    
    
    open func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.appBasic
        }
    }
    
    
}
