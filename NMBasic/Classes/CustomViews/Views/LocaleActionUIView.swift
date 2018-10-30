//
//  LocaleActionUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

open class LocaleActionUIView: UIView   {
    
    @IBOutlet weak open var button: LocaleKeyUIButton!
    @IBOutlet weak open var loader: TintedUIActivityIndicatorView!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
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
    
    open func changeTitle(title: String) {
        self.button.setTitle(title, for: .normal)
    }
    
    open func enable(bool: Bool) {
        self.button?.isEnabled = bool
        self.button.enable(bool: bool)
    }
    
    open  func setLoading(start: Bool) {
        if start {
            self.disable()
            self.loader.startAnimating()
        }else   {
            self.enable()
            self.loader.stopAnimating()
        }
    }
}
