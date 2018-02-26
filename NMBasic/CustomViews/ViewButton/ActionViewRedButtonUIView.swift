//
//  ActionViewRedButtonUIView.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 10/25/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class ActionViewRedButtonUIView: UIView  {
    
    @IBOutlet weak public var button: TintedUIButton!
    @IBOutlet weak public var image: TintedRedUIImageView!
    @IBOutlet weak public var loader: TintedUIActivityIndicatorView!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if self.image.image != nil    {
            let resizedImage = image.image!
            image.image = resizedImage.withRenderingMode(.alwaysTemplate)
            tintColor =  UIColor.appBasic
        }
    }
    
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
    
    private func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.lightGray
        }
    }
    
    private func setLoading(start: Bool) {
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
    
    public func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }
    
}
