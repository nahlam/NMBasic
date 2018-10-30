//
//  NSString+Language.swift
//  4Sale
//
//  Created by Nahla Mortada on 8/1/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

import Foundation

public extension String    {
    
    
    public func nm_isArabic() -> Bool {
        if self.isEmpty {
            return false
        }
        let tagschemes = [NSLinguisticTagScheme.language]
        let tagger: NSLinguisticTagger = NSLinguisticTagger(tagSchemes: tagschemes, options: 0)
        tagger.string = self
        
        let language = tagger.tag(at: 0, scheme: NSLinguisticTagScheme.language, tokenRange: nil, sentenceRange: nil)?.rawValue
        print("[BF] :  \(language ?? "no lang")")
        return (language == "ar")
    }
    
}
