//
//  MoreViewItem.swift
//  NMBasic
//
//  Created by Nahla Mortada on 8/29/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

@IBDesignable
open class MoreViewItem: UIView  {
    
    @IBOutlet weak open var imageView: UIImageView!
    @IBOutlet weak open var titleLabel: LocaleKeyUILabel!
    @IBOutlet weak open var button: UIButton!
    @IBInspectable open var actionKey: String = ""
    @IBInspectable open var performSelectoryIdentifier: String = ""
    @IBInspectable open var isPerformSegue: Bool = false
    
    open var disable: Bool = false {
        didSet{
            self.disableAndDimm()
        }
    }
    
    private func disableAndDimm()   {
        if self.disable {
            self.titleLabel?.textColor = UIColor.lightGrey30
            self.imageView?.alpha = 0.3
        }else {
            self.titleLabel?.textColor = UIColor.black
            self.imageView?.alpha = 1.0
        }
        self.button?.isEnabled = !self.disable
    }
    
}
