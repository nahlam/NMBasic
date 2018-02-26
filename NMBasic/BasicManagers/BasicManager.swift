//
//  BasicManager.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import SwiftyJSON
import GeneralLocalization

open class BasicManager: NSObject {
    
    open static let ErrorDomain = "Q84Sale.com"
    
    public struct Constants {
        static let ErrorCode = "code"
        static let ErrorMessage = "message"
        static let ErrorArabic = "message_ar"
        static let ErrorEnglish = "message_en"
        static let NoInternetConnectionErrorCode: Int = 404
    }
    
    public struct StringsKeys {
        static let GeneralError = "general-error"
        static let AutomaticTime = "automatic-time"
        static let NoInternetConnection = "no-internet-connection"
    }
    
    // MARK: - Errors
    
    open class func getGeneralError() -> Error {
        return self.getErrorWithMessage(message: String.localized(key:  BasicManager.StringsKeys.GeneralError))
    }
    
    open class func getErrorWithMessage(message: String?) -> Error {
        if message == nil {
            return self.getGeneralError()
        }
        let errorDict: [String : AnyObject] = [BasicManager.Constants.ErrorCode: BasicManager.Constants.NoInternetConnectionErrorCode as AnyObject, BasicManager.Constants.ErrorMessage: message! as AnyObject]
        let errorJSON: JSON = JSON(errorDict)
        
        return self.getErrorFromDictionary(errorDict: errorJSON)
    }
    
    open class func getErrorFromDictionary(errorDict: JSON?) -> Error {
        if errorDict == nil {
            return self.getGeneralError()
        }
        var errorDetail: [String : AnyObject] = [String : AnyObject]()
        var description: String?
        let message:String? = errorDict![BasicManager.Constants.ErrorMessage].stringValue
        let code: Int = errorDict![BasicManager.Constants.ErrorCode].intValue
        
        if code == 1 {
            description = String.localized(key:  BasicManager.StringsKeys.AutomaticTime)
        }else {
            if message != nil, message!.isEmpty == false {
                description = message!
            }
            else {
                let isArabic: Bool = LanguageManager.shared.isArabic
                if isArabic {
                    let messageAr = errorDict![BasicManager.Constants.ErrorArabic].stringValue
                    if messageAr.isEmpty == false {
                        description = messageAr
                    }
                }
                else {
                    let messageEn = errorDict![BasicManager.Constants.ErrorEnglish].stringValue
                    if messageEn.isEmpty == false {
                        description = messageEn
                    }
                }
            }
        }
        
        
        
        if description == nil {
            return self.getGeneralError()
        }
        
        errorDetail[NSLocalizedDescriptionKey] = description as AnyObject?
        
        let errorIntance: NSError = NSError(domain: BasicManager.ErrorDomain, code: code, userInfo: errorDetail)
        return errorIntance
    }
    
    open class func getErrorFromMessage(errorMessage: String?) -> Error {
        if errorMessage == nil {
            return self.getGeneralError()
        }
        var errorDetail: [AnyHashable: Any] = [AnyHashable: Any]()
        errorDetail[NSLocalizedDescriptionKey] = errorMessage
        let code: CFNetworkErrors = CFNetworkErrors.cfurlErrorNotConnectedToInternet
        let errorIntance: NSError = NSError(domain: BasicManager.ErrorDomain, code: Int(code.rawValue), userInfo: errorDetail)
        return errorIntance
    }
    
    open class func notInternetConnectionError(error: NSError) -> Bool {
        
        if error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorUnsupportedURL || error.code == NSURLErrorCannotFindHost || error.code == NSURLErrorCannotConnectToHost {
            return true
        }
        return false
    }
    
    open class func getNoInternetConnectionError () -> Error {
        
        var errorDetail: [String : AnyObject] = [String : AnyObject]()
        errorDetail[NSLocalizedDescriptionKey] = [String.localized(key:  BasicManager.StringsKeys.NoInternetConnection)] as AnyObject?
        let errorIntance: NSError = NSError(domain: BasicManager.ErrorDomain, code: BasicManager.Constants.NoInternetConnectionErrorCode, userInfo: errorDetail)
        return errorIntance
        
        
    }
    
}
