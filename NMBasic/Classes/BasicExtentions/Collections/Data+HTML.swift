//
//  Data+HTML.swift
//  NMBasic
//
//  Created by Nahla Mortada on 11/23/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension Data {
    
    public var attributedString: NSAttributedString? {
        do {
            
            return try NSAttributedString(data: self, options:[NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.plain, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
