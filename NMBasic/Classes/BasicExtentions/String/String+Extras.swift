//
//  String+Extras.swift
//  NMBasic
//
//  Created by Nahla Mortada on 1/2/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit

public extension String {
    
    public func getImageName() -> String {
        return self.getImageName(stringPath: self)
    }
    
    public func getImageName(stringPath: String) -> String {
        let components = stringPath.components(separatedBy: "//")
        if components.last != nil {
            return components.last!
        }
        return stringPath
    }
}
