//
//  UIAlertController+Show.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 3/26/17.
//  Copyright © 2017 Technivance. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController {
    
  
    public class func showNoTitleAlert(_ message: String) {
        
        showOkAlert(nil, message: message)
    }
    
    public class func showErrorAlert(_ errorMessage: String) {
        showOkAlert(String.localized(key: NMBasicManager.Strings.Error.Error), message: errorMessage)
    }
    
    public class func showOkAlert(_ title: String?, message: String?) {
        
        let okay = String.localized(key: NMBasicManager.Strings.Okay)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: okay, style: UIAlertActionStyle.default, handler: nil))
        if let controller = UIApplication.topViewController()   {
            
            if UIDevice.isIPad {
                controller.popoverPresentationController?.sourceView = controller.view
                controller.popoverPresentationController?.sourceRect = CGRect(x: controller.view.bounds.size.width / 2.0, y: controller.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
                
            }
            DispatchQueue.main.async {
                controller.navigationController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    public class func showOkAlert(_ title: String?, message: String?, navigation: UINavigationController?) {
        
        let okay = String.localized(key: NMBasicManager.Strings.Okay)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: okay, style: UIAlertActionStyle.default, handler: nil))
        DispatchQueue.main.async {
            navigation?.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    public class func showOkCancelAlert(_ title: String?, message: String?, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let yes = String.localized(key: NMBasicManager.Strings.Yes)
        let no = String.localized(key: NMBasicManager.Strings.No)
        showActionDismissAlert(title, message: message, actionTitle: yes, dismissTitle: no, navigation: navigation, handler: handler)
    }
    
    
    
    public class func showYesNoAlert(_ title: String?, message: String?, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let okay = String.localized(key: NMBasicManager.Strings.Okay)
        let cancel = String.localized(key: NMBasicManager.Strings.Cancel)
        showActionDismissAlert(title, message: message, actionTitle: okay, dismissTitle: cancel, navigation: navigation, handler: handler)
    }
    
    
    public class func showActionDismissAlert(_ title: String?, message: String?, actionTitle: String , dismissTitle: String, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: handler))
        alert.addAction(UIAlertAction(title: dismissTitle, style: .destructive, handler: nil))
        
        DispatchQueue.main.async {
            if navigation == nil {
                let viewController = UIViewController.topMostViewController()
                viewController.present(alert, animated: true, completion: nil)
            }else {
                navigation?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    public class func showActionAlert(_ title: String?, message: String?, actionTitle: String, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: handler))
        
        DispatchQueue.main.async {
            if navigation == nil {
                let viewController = UIViewController.topMostViewController()
                viewController.present(alert, animated: true, completion: nil)
            }else {
                navigation?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    public class func showErrorActionAlert( message: String?, actionTitle: String, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        self.showActionAlert(String.localized(key: NMBasicManager.Strings.Error.Error), message: message, actionTitle: actionTitle, navigation: navigation, handler: handler)
    }
    
    
}
