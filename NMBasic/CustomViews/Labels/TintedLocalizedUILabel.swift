//
//  LocalizedQ8UILabel.swift
//  Q8Car
//
//  Created by Nahla Mortada on 8/31/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedLocalizedUILabel: LocalizedUILabel {
    
    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        textColor = UIColor.appBasic
    }
}
