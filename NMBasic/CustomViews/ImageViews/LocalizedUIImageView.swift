//
//  LocalizedImageView.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

public class LocalizedUIImageView: UIImageView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.flip()
    }
    
    public func flip() {
        if LanguageManager.shared.isArabic {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    public func addBasicTint ()    {
        let newImage = self.image!.nm_tint(color: UIColor.appBasic)
        self.image = newImage
    }
}
