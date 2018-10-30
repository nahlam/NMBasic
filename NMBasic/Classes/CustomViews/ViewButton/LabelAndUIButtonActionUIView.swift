//
//  ActionButtonViewWithLabel.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/7/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class LabelAndUIButtonActionUIView: UIView {
    
    @IBOutlet weak open var button: TintedUIButton!
    @IBOutlet weak open var label: TintedUILabel!
    @IBOutlet weak open var image: TintedUIImageView!
    
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
    
    open func dimm() {
       glow(bool: false)
    }
    
    open func glow() {
        glow(bool: true)
    }
    
    open func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }
    
    open func changeTitle(title: String)  {
        self.label?.text = title
    }
    
    
    open func glow(bool: Bool) {
        if bool {
            self.image.tintColor = UIColor.appBasic
            self.label.textColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.gray
            self.label.textColor = UIColor.gray
        }
    }
    
    open func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
            self.label.textColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.gray
            self.label.textColor = UIColor.gray
        }
    }
    
    open func setLoading(start: Bool) {
        if start {
            self.button.isEnabled = false
            self.image.isHidden = true
        }else   {
            self.button.isEnabled = true
            self.image.isHidden = false
        }
    }
    
    
}
