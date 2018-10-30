//
//  SelectionLabelImageActionUIView.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 10/25/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class SelectionLabelImageActionUIView: UIView {
    
    @IBOutlet weak open var button: UIButton!
    @IBOutlet weak open var label: LocaleKeyUILabel!
    @IBOutlet weak open var image: UIImageView!
    @IBOutlet weak open var selectionImage: UIImageView!
    @IBOutlet weak open var loader: UIActivityIndicatorView!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.nm_rounded(radius: 5)
    }
    
    open func enable()   {
        enable(bool: true)
    }
    
    open func disable()   {
        enable(bool: false)
    }
    
    open func startLoading()    {
        setLoading(start: true)
    }
    
    open func stopLoading()    {
        setLoading(start: false)
    }
    
    open func dimm() {
        glow(bool: false)
    }
    
    open func glow() {
        glow(bool: true)
    }
    
    open func changeIcon(imageString: String)   {
        self.image?.image = UIImage(named: imageString)
    }
    
    open func changeTitle(title: String)  {
        self.label?.text = title
    }
    
    
    open func glow(bool: Bool) {
        self.selectionImage?.isHidden = !bool
        self.glowContent(bool: bool)
    }
    
    open func enable(bool: Bool) {
        self.button?.isEnabled = bool
        self.glowContent(bool: bool)
    }
    
    open func setLoading(start: Bool) {
        if start {
            self.button?.isEnabled = false
            self.image?.isHidden = true
            self.loader?.startAnimating()
        }else   {
            self.button?.isEnabled = true
            self.image?.isHidden = false
            self.loader?.stopAnimating()
        }
    }
    
    open func glowContent(bool: Bool)   {
        if bool {
            self.image?.alpha = 1.0
            self.label?.textColor = UIColor.appBasic
        }else   {
            self.image?.alpha = 0.3
            self.label?.textColor = UIColor.lightGrey30
        }
    }
}
