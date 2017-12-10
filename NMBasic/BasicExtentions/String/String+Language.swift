//
//  NSString+Language.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation

public extension String    {
    
    
    public func nm_isArabic() -> Bool {
        if self.isEmpty {
            return false
        }
        let tagschemes: [String] = [NSLinguisticTagSchemeLanguage]
        let tagger: NSLinguisticTagger = NSLinguisticTagger(tagSchemes: tagschemes, options: 0)
        tagger.string = self
        
        let language: String? = tagger.tag(at: 0, scheme: NSLinguisticTagSchemeLanguage, tokenRange: nil, sentenceRange: nil)
        print("[BF] :  \(language ?? "no lang")")
        return (language == "ar")
    }
    
}
