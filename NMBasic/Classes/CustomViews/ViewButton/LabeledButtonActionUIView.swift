//
//  Q8LoadingUIButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/1/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class LabeledButtonActionUIView: UIView   {
    
    @IBOutlet weak open var button: TintedBGUIButton!
    @IBOutlet weak open var loader: TintedUIActivityIndicatorView!
 
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        button?.setBackgroundColor(color: UIColor.lightGray, forState: .disabled)
        button?.setTitleColor(UIColor.black, for: UIControl.State.disabled)
        button?.setBackgroundColor(color: UIColor.appBasic, forState: .normal)
        button?.setTitleColor(UIColor.white, for: .normal)
        button?.nm_rounded(radius: 5.0)
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
    
    public func changeTitle(title: String) {
        self.button.setTitle(title, for: .normal)
    }
    
    public func enable(bool: Bool) {
        self.button?.isEnabled = bool
        if bool {
            self.button?.backgroundColor = UIColor.appBasic
        }else {
            self.button?.backgroundColor = UIColor.gray
        }
    }
    
    public func setLoading(start: Bool) {
        if start {
            self.disable()
            self.loader.startAnimating()
        }else   {
            self.enable()
            self.loader.stopAnimating()
        }
    }
    
}
