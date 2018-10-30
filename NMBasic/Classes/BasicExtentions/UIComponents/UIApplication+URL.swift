//
//  UIApplication+URL.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/9/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation

import UIKit

public extension UIApplication {
    
    public class func callNumber(_ phoneNumber:String) {
        
        let cleanedArray: [String] = phoneNumber.components(separatedBy: CharacterSet(charactersIn: "0123456789-+()").inverted)
        let cleanedString: String = cleanedArray.joined(separator: "")
        let escapedPhoneNumber: String = cleanedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let phoneURLString: String = "tel://+\(escapedPhoneNumber)"
        _ = UIApplication.openURL(phoneURLString)
    }
    
    public class func openURL(_ urlString:String) -> Bool {
        
        if let url: URL = URL(string: urlString as String) {
            return UIApplication.openURL(url: url)
        }else   {
            
            UIAlertController.showErrorAlert("\(String.localized(key: BasicFrameworkManager.Strings.Error.OpenURLError))\(urlString)")
            return false
        }
    }
    
    public class func canOpenURl(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
    
    public class func openURL(url: URL) -> Bool    {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            return true
        }
        return false
    }
    
}

