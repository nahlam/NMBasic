//
//  NMBasic.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class NMBasicManager: NSObject {
    
    public struct ImagesNames {
        static let NormalBackImage                  = "Basic-NavBarBack"
        static let NormalCloseImage                 = "Basic-NavBarClose"
    }
    
    public struct Strings   {
        
        static let BackButtonAccessibilityHintLabel = "BASIC-back-button"
        static let BackButtonAccessibilityHint      = "BASIC-back-button-hint"
        
        static let Okay                             = "BASIC-ok"
        static let Done                             = "BASIC-done"
        static let Cancel                           = "BASIC-cancel"
        
        static let Yes                              = "BASIC-yes"
        static let No                               = "BASIC-no"
        
        public struct Error {
            static let Error                        = "BASIC-error"
            static let OpenURLError                 = "BASIC-open-url-error"
            static let SMSError                     = "BASIC-send-sms-error"
        }
        
        public struct Location  {
            static let LocationPickerTitle          = "BASIC-Location-picker-title"
            static let LocationChooseHint           = "BASIC-Location-choose-hint"
            static let LocationStringPrefix         = "BASIC-Location-string-prefix"
        }
    }
    
    public static let defaultRegionId = 1
    private(set) var basicColor: UIColor?
    
    public static let shared = NMBasicManager()
    private override init() {}
    
    open class func initalize(basicColor: UIColor)  {
        NMBasicManager.shared.basicColor = basicColor
    }
    
    
}
