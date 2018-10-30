//
//  BasicFramework.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public class BasicFrameworkManager: NSObject {
    
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
            static let GeneralError                 = "BASIC-Network-Error-general-error"
            static let AutomaticTime                = "BASIC-Network-Error-automatic-time"
            static let NoInternetConnection         = "BASIC-Network-Error-no-internet-connection"
        }
        
        public struct Location  {
            static let LocationPickerTitle          = "BASIC-Location-picker-title"
            static let LocationChooseHint           = "BASIC-Location-choose-hint"
            static let LocationStringPrefix         = "BASIC-Location-string-prefix"
        }
        
        public struct MediaPicker {
            static let Preview                      = "BASIC-Media-preview"
            static let AllowAccessTitle             = "BASIC-Media-allow-access-title"
            static let MicrophoneOff                = "BASIC-Media-microphone-is-off-message"
            static let VideoCaptureError            = "BASIC-Media-video-capture-error"
            static let CameraOff                    = "BASIC-Media-camera-is-off-message"
            static let MaxImagesReached             = "BASIC-Media-max-images-reached"
            static let MicrophonePermissionDenied   = "BASIC-Media-mircophone-permission-denied"
        }
        
        public struct Formats   {
            static let Hour                         = "BASIC-Formats-hour"
            static let Hours                        = "BASIC-Formats-hours"
            static let Minute                       = "BASIC-Formats-minute"
            static let Minutes                      = "BASIC-Formats-minutes"
            static let Second                       = "BASIC-Formats-second"
            static let Seconds                      = "BASIC-Formats-seconds"
            static let Today                        = "BASIC-Formats-today"
            static let At                           = "BASIC-Formats-at"
            static let Yesterday                    = "BASIC-Formats-yesterday"
        }
    }
    
    public static let defaultRegionId = 1
    private(set) var basicColor: UIColor?
    
    public static let shared = BasicFrameworkManager()
    private override init() {}
    
    open class func initalize(basicColor: UIColor)  {
        BasicFrameworkManager.shared.basicColor = basicColor
    }
    
    
}
