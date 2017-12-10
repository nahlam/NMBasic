//
//  EnableDisableImageUIButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 9/6/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class EnableDisableImageUIButton: LocaleKeyUIButton {
    
    @IBInspectable public var enableImageName: String = ""
    @IBInspectable public var disableImageName: String = ""
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.setImage(UIImage(named: enableImageName), for: .normal)
        self.setImage(UIImage(named: disableImageName), for: .selected)
    }
    
}
