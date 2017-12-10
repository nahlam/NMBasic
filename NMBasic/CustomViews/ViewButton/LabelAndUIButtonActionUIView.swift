//
//  ActionButtonViewWithLabel.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/7/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class LabelAndUIButtonActionUIView: UIView {
    
    @IBOutlet weak public var button: TintedUIButton!
    @IBOutlet weak public var label: TintedUILabel!
    @IBOutlet weak public var image: TintedUIImageView!
    
    public func enable()   {
        enable(bool: true)
    }
    
    public func disable()   {
        enable(bool: false)
    }
    
    public func startLoading ()    {
        setLoading(start: true)
    }
    
    public func stopLoading ()    {
        setLoading(start: false)
    }
    
    public func dimm() {
       glow(bool: false)
    }
    
    public func glow() {
        glow(bool: true)
    }
    
    public func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }
    
    public func changeTitle(title: String)  {
        self.label?.text = title
    }
    
    
    private func glow(bool: Bool) {
        if bool {
            self.image.tintColor = UIColor.appBasic
            self.label.textColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.gray
            self.label.textColor = UIColor.gray
            
            
        }
    }
    
    private func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
            self.label.textColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.gray
            self.label.textColor = UIColor.gray
        }
    }
    
    private func setLoading(start: Bool) {
        if start {
            self.button.isEnabled = false
            self.image.isHidden = true
        }else   {
            self.button.isEnabled = true
            self.image.isHidden = false
        }
    }
    
    
}
