//
//  ImageButtonUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class ImageButtonUIView: UIView {
    
    @IBOutlet weak public var button: TintedUIButton!
    @IBOutlet weak public var image: TintedUIImageView!
    
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
    
    public func changeIcon(imageString: String)   {
        self.image.image = UIImage(named: imageString)
    }
    
    
    private func enable(bool: Bool) {
        self.button.isEnabled = bool
        if bool {
            self.image.tintColor = UIColor.appBasic
        }else   {
            self.image.tintColor = UIColor.appBasic
        }
    }
    
    
}
