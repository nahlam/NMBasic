//
//  Q8LocalizedTintedUIImageView.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit
import GeneralLocalization

public class LocalizedTintedUIImageView: TintedUIImageView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.flip()
    }
    
    public func flip() {
        if LanguageManager.shared.isArabic {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
}
