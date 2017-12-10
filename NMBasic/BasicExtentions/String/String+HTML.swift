//
//  NSString+HTML.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation

public extension String {
    
    
    public var nm_utf8Data: Data? {
        return data(using: .utf8)
    }
    
    
    public func nm_plainTextFromHTML() -> String {
        let regexPattern = "<.*?>"
        do {
            let stripHTMLRegex = try NSRegularExpression(pattern: regexPattern, options: NSRegularExpression.Options.caseInsensitive)
            let plainText = stripHTMLRegex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, self.count), withTemplate: "")
            return plainText
        } catch {
            print("Warning: failed to create regular expression from pattern: \(regexPattern)")
            return ""
        }
    }
    
    
    
}
