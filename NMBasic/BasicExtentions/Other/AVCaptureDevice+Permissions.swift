//
//  AVCaptureDevice+Permissions.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import AVFoundation

extension AVCaptureDevice   {
    
    public class func canAccessCamera() -> Bool {
        
        let status:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if status == AVAuthorizationStatus.authorized {
            return true
        }
        return false
    }
    
    public class func requestAccessCamera(handler: ((Bool) -> Swift.Void)!) {
        
        let status:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        if status == AVAuthorizationStatus.notDetermined {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted) in
                handler(granted)
            })
        }else {
            if AVCaptureDevice.canAccessCamera() {
                handler(true)
            }else   {
                handler(false)
            }
        }
    }
}
