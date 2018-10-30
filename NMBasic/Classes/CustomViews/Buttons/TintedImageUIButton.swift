//
//  UITintedImageButton.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/3/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedImageUIButton: UIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)!
        if let image = self.image(for: .normal)   {
            setImage(image.nm_tint(color: UIColor.appBasic), for: .normal)
            setImage(image.nm_tint(color: UIColor.lightGray), for: .disabled)
        }
        
    }
}

