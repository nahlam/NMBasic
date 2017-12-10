//
//  SelectionLabelImageActionUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 10/25/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class SelectionLabelImageActionUIView: UIView {
    
    @IBOutlet weak public var button: UIButton!
    @IBOutlet weak public var label: LocaleKeyUILabel!
    @IBOutlet weak public var image: UIImageView!
    @IBOutlet weak public var selectionImage: UIImageView!
    @IBOutlet weak public var loader: UIActivityIndicatorView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.nm_rounded(radius: 5)
    }
    
    public func enable()   {
        enable(bool: true)
    }
    
    public func disable()   {
        enable(bool: false)
    }
    
    public func startLoading()    {
        setLoading(start: true)
    }
    
    public func stopLoading()    {
        setLoading(start: false)
    }
    
    public func dimm() {
        glow(bool: false)
    }
    
    public func glow() {
        glow(bool: true)
    }
    
    public func changeIcon(imageString: String)   {
        self.image?.image = UIImage(named: imageString)
    }
    
    public func changeTitle(title: String)  {
        self.label?.text = title
    }
    
    
    private func glow(bool: Bool) {
        self.selectionImage?.isHidden = !bool
        self.glowContent(bool: bool)
    }
    
    private func enable(bool: Bool) {
        self.button?.isEnabled = bool
        self.glowContent(bool: bool)
    }
    
    private func setLoading(start: Bool) {
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
    
    private func glowContent(bool: Bool)   {
        if bool {
            self.image?.alpha = 1.0
            self.label?.textColor = UIColor.appBasic
        }else   {
            self.image?.alpha = 0.3
            self.label?.textColor = UIColor.lightGrey30
        }
    }
}
