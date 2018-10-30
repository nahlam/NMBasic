//
//  LocalizedImageView.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

open class LocalizedUIImageView: UIImageView {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.flip()
    }
    
    open func flip() {
        if LanguageManager.shared.isArabic {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    open func addBasicTint ()    {
        let newImage = self.image!.nm_tint(color: UIColor.appBasic)
        self.image = newImage
    }
}
