//
//  ActionViewButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/27/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RedButtonActionUIView: UIView  {
    
    @IBOutlet weak open var button: TintedUIButton!
    @IBOutlet weak open var image: TintedRedUIImageView!
    @IBOutlet weak open var loader: TintedUIActivityIndicatorView!
    
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
    
    open func startLoading ()    {
        setLoading(start: true)
    }
    
    open func stopLoading ()    {
        setLoading(start: false)
    }
    
    open func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }

    
    open func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.lightGray
        }
    }
    
    open func setLoading(start: Bool) {
        if start {
            self.button.isEnabled = false
            self.image.isHidden = true
            self.loader.startAnimating()
        }else   {
            self.button.isEnabled = true
            self.image.isHidden = false
            self.loader.stopAnimating()
        }
    }
    
    
    
}
