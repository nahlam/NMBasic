//
//  UITintedImageButton.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/3/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit


public class TintedImageUIButton: UIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)!
        if let image = self.image(for: .normal)   {
            setImage(image.nm_tint(color: UIColor.appBasic), for: .normal)
            setImage(image.nm_tint(color: UIColor.lightGray), for: .disabled)
        }
        
    }
}

