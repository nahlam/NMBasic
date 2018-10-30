//
//  NMRoundedTintedEdgesUIView.swift
//  NMBasic
//
//  Created by Nahla Mortada on 3/19/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit

open class NMRoundedTintedEdgesUIView: UIView {

    required public init(coder aDecoder: NSCoder)  {
        
        super.init(coder: aDecoder)!
        nm_rounded(radius: 3, borderWidth: 1, color: UIColor.appBasic)
    }
}
