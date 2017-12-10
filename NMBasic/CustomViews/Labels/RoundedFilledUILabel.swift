//
//  RoundedFilledUILabel.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/6/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation

public class RoundedFilledUILabel: TintedBGUILabel   {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
         self.nm_rounded(radius: 5.0)
    }
}
