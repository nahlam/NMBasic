//
//  NMTintedUILabel.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 12/3/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class NMTintedUILabel: TintedUILabel {

    public func enable(bool: Bool)  {
        textColor = bool ? UIColor.appBasic : UIColor.lightGrey30
    }
    
}
