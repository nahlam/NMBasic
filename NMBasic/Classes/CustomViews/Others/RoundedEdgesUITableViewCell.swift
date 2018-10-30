//
//  RoundedEdgesUITableViewCell.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class RoundedEdgesUITableViewCell: UITableViewCell {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.nm_rounded(radius: 5)
    }
    
}
