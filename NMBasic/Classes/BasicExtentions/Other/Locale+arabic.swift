//
//  Locale+arabic.swift
//  NMBasic
//
//  Created by Nahla Mortada on 4/3/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

public extension Locale {
    
    public var isArabic: Bool {
        if let langStr = Locale.current.languageCode    {
            return langStr.contains("ar")
        }
        return false
    }
}
