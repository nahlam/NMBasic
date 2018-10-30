//
//  RoundedFilledUILabel.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/6/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation

open class RoundedFilledUILabel: TintedBGUILabel   {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         self.nm_rounded(radius: 5.0)
    }
}
