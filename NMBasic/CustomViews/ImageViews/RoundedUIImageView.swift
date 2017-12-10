//
//  RoundedUIImageView.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/17/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public class RoundedUIImageView: UIImageView {
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        nm_roundedView()
    }
    
}
