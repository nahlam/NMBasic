//
//  TintedUIProgressView.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 6/29/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class TintedUIProgressView: UIProgressView {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        trackTintColor = UIColor.gray
        progressTintColor = UIColor.appBasic
    }
    
}
