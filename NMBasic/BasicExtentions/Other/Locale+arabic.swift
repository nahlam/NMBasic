//
//  Locale+arabic.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 4/3/17.
//  Copyright © 2017 Technivance. All rights reserved.
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
