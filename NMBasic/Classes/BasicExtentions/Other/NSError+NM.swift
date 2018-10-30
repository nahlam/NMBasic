//
//  Error+NM.swift
//  NMBasic
//
//  Created by Nahla Mortada on 9/24/18.
//

import UIKit
import GeneralLocalization
import SwiftyJSON

public struct ErrorNetworkConstants {
    
    public static let ErrorDomain = "nm.com"
    
    public struct ErrorKeysConstants {
        public static let ErrorCode = "code"
        public static let ErrorMessage = "message"
        public static let ErrorArabic = "message_ar"
        public static let ErrorEnglish = "message_en"
    }
    
    public struct ErrorStringsKeys {
        static let GeneralError = BasicFrameworkManager.Strings.Error.GeneralError
        static let AutomaticTime = BasicFrameworkManager.Strings.Error.AutomaticTime
        static let NoInternetConnection = BasicFrameworkManager.Strings.Error.NoInternetConnection
    }
}


public extension NSError {
    
    public static func getGeneralError() -> Error {
        return getError(WithMessage: String.localized(key:  ErrorNetworkConstants.ErrorStringsKeys.GeneralError))
    }
    
    public static func getError(WithMessage message: String?) -> Error {
        if message == nil {
            return getGeneralError()
        }
        let code: CFNetworkErrors = CFNetworkErrors.cfurlErrorNotConnectedToInternet
        let errorDict: [String : AnyObject] = [ErrorNetworkConstants.ErrorKeysConstants.ErrorCode: code as AnyObject, ErrorNetworkConstants.ErrorKeysConstants.ErrorMessage: message! as AnyObject]
        return getError(withDictionary: JSON(errorDict))
    }
    
    public static func getError(withDictionary dictionary: JSON?) -> Error {
        if dictionary == nil {
            return getGeneralError()
        }
        
        let description: String
        let message: String = dictionary![ErrorNetworkConstants.ErrorKeysConstants.ErrorMessage].stringValue
        let code: Int = dictionary![ErrorNetworkConstants.ErrorKeysConstants.ErrorCode].intValue
        if code == 1 {
            description = String.localized(key:  ErrorNetworkConstants.ErrorStringsKeys.AutomaticTime)
        }else {
            if message.isEmpty {
                let messageAr = dictionary![ErrorNetworkConstants.ErrorKeysConstants.ErrorArabic].stringValue
                let messageEn = dictionary![ErrorNetworkConstants.ErrorKeysConstants.ErrorEnglish].stringValue
                let isEnglish: Bool = LanguageManager.shared.isEnglish
                description = isEnglish && !messageEn.isEmpty ? messageEn : messageAr
            }else {
                description = message
            }
        }
        let errorDetail: [String : AnyObject] = [NSLocalizedDescriptionKey: description as AnyObject]
        let errorIntance: NSError = NSError(domain: ErrorNetworkConstants.ErrorDomain, code: code, userInfo: errorDetail)
        return errorIntance
    }
    
    
    public static func getNoInternetError(withMessage message: String? = nil) -> Error {
        let errorDetail: [String : AnyObject] = [NSLocalizedDescriptionKey: (message != nil ? message! : String.localized(key:  ErrorNetworkConstants.ErrorStringsKeys.NoInternetConnection)) as AnyObject]
        let code: CFNetworkErrors = CFNetworkErrors.cfurlErrorNotConnectedToInternet
        let errorIntance: NSError = NSError(domain: ErrorNetworkConstants.ErrorDomain, code: Int(code.rawValue), userInfo: errorDetail)
        return errorIntance
    }
    
    public func isInternetConnectionError(error: NSError) -> Bool {
        return error.isInternetConnectionError()
    }
    
    public static func isNotInternetConnectionError(error: NSError) -> Bool {
        return error.isNotInternetConnectionError()
    }
    
    public func isInternetConnectionError() -> Bool {
        
        if code == NSURLErrorNotConnectedToInternet || code == NSURLErrorUnsupportedURL || code == NSURLErrorCannotFindHost || code == NSURLErrorCannotConnectToHost {
            return true
        }
        return false
    }
    
    public func isNotInternetConnectionError() -> Bool {
        return !isInternetConnectionError()
    }
}
