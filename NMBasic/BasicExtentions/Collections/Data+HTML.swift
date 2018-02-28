//
//  Data+HTML.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/23/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension Data {
    public var attributedString: NSAttributedString? {
        do {
            
            return try NSAttributedString(data: self, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
