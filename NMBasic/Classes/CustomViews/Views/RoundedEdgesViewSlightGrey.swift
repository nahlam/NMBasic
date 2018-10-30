//
//  RoundedEdgesUIViewSlightGrey.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/8/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation

open class RoundedEdgesUIViewSlightGrey: UIView  {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        nm_rounded(radius: 5, borderWidth: 0.5, color: UIColor.appBasic)
    }
    
}
