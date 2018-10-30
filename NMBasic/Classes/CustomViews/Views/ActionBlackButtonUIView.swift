//
//  ActionButtonUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/23/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class ActionBlackButtonUIView: UIView  {
    
    @IBOutlet weak open var button: UIButton!
    @IBOutlet weak open var loader: TintedUIActivityIndicatorView!
    
    
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
    
    open func enable(bool: Bool) {
        self.button?.isEnabled = bool
    }
    
    open func setLoading(start: Bool) {
        if start {
            self.button?.isEnabled = false
            self.button?.isHidden = true
            self.loader?.startAnimating()
        }else   {
            self.button?.isEnabled = true
            self.button?.isHidden = false
            self.loader?.stopAnimating()
        }
    }
    
    open func changeTitle(string: String)    {
        self.button?.setTitle(string, for: .normal)
    }
    
    open func changeTitle(localeKey: String)    {
        self.button?.setTitle(String.localized(key: localeKey), for: .normal)
    }
    
    open func changeIcon(imageString: String)   {
        self.button?.setImage(UIImage(named: imageString), for: .normal)
    }
    
}
