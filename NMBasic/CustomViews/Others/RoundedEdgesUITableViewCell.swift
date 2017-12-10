//
//  RoundedEdgesUITableViewCell.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 9/5/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class RoundedEdgesUITableViewCell: UITableViewCell {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.nm_rounded(radius: 5)
    }
    
}
