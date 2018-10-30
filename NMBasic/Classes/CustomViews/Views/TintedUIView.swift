//
//  TintedUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/25/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation

open class TintedUIView: UIView {
    
    required public init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        backgroundColor = UIColor.appBasic
    }
}
