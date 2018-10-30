//
//  TintedUIProgressView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 6/29/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class TintedUIProgressView: UIProgressView {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        trackTintColor = UIColor.gray
        progressTintColor = UIColor.appBasic
    }
    
}
