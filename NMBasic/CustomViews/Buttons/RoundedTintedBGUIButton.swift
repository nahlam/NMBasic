//
//  TintedBGUIButtonRounded.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/25/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class RoundedTintedBGUIButton: TintedBGUIButton {
    
    required public init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
        nm_rounded(radius: 5.0)
    }
}
