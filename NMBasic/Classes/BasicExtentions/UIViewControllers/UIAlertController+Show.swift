//
//  UIAlertController+Show.swift
//  NMBasic
//
//  Created by Nahla Mortada on 3/26/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController {
  
    public class func getOkAlert(_ title: String?, message: String?) -> UIAlertController {
        
        let okay = String.localized(key: BasicFrameworkManager.Strings.Okay)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: okay, style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
    
    public class func showNoTitleAlert(_ message: String) {
        
        showOkAlert(nil, message: message)
    }
    
    public class func showErrorAlert(_ errorMessage: String) {
        showOkAlert(String.localized(key: BasicFrameworkManager.Strings.Error.Error), message: errorMessage)
    }
    
    public class func showOkAlert(_ title: String?, message: String?) {
        
        let okay = String.localized(key: BasicFrameworkManager.Strings.Okay)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: okay, style: UIAlertAction.Style.default, handler: nil))
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
        
        let okay = String.localized(key: BasicFrameworkManager.Strings.Okay)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: okay, style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            navigation?.present(alert, animated: true, completion: nil)
        }
    }
    
    public class func showOkCancelAlert(_ title: String?, message: String?, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let yes = String.localized(key: BasicFrameworkManager.Strings.Yes)
        let no = String.localized(key: BasicFrameworkManager.Strings.No)
        showActionDismissAlert(title, message: message, actionTitle: yes, dismissTitle: no, navigation: navigation, handler: handler)
    }
    
    public class func showYesNoAlert(_ title: String?, message: String?, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let okay = String.localized(key: BasicFrameworkManager.Strings.Okay)
        let cancel = String.localized(key: BasicFrameworkManager.Strings.Cancel)
        showActionDismissAlert(title, message: message, actionTitle: okay, dismissTitle: cancel, navigation: navigation, handler: handler)
    }
    
    class func showYesNoAlertWithTwoActions(_ title: String?, message: String?, navigation: UINavigationController? , yesHandler : ((UIAlertAction) -> Swift.Void)?, noHandler : ((UIAlertAction) -> Swift.Void)?) {
        
        let yes = String.localized(key: BasicFrameworkManager.Strings.Yes)
        let no = String.localized(key: BasicFrameworkManager.Strings.No)
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = UIColor.appBasic
        alert.addAction(UIAlertAction(title: yes, style: .default, handler: yesHandler))
        alert.addAction(UIAlertAction(title: no, style: .default, handler: noHandler))
        self.presentAlertController(alert: alert, navigation: navigation)
    }

    public class func showActionDismissAlert(_ title: String?, message: String?, actionTitle: String , dismissTitle: String, navigation: UINavigationController? , handler : ((UIAlertAction) -> Swift.Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
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
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
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
        
        self.showActionAlert(String.localized(key: BasicFrameworkManager.Strings.Error.Error), message: message, actionTitle: actionTitle, navigation: navigation, handler: handler)
    }
    
    public class func presentAlertController(alert: UIAlertController, navigation: UINavigationController?) {
        let controller = UIViewController.currentViewController()
        
        if UIDevice.isIPad {
            controller.popoverPresentationController?.sourceView = controller.view
            controller.popoverPresentationController?.sourceRect = CGRect(x: controller.view.bounds.size.width / 2.0, y: controller.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
        }
        
        DispatchQueue.main.async {
            if navigation == nil {
                controller.present(alert, animated: true, completion: {
                    alert.view.tintColor = UIColor.appBasic
                })
            }else {
                navigation?.present(alert, animated: true, completion: {
                    alert.view.tintColor = UIColor.appBasic
                })
            }
        }
    }
    
    public class func presentAlertController(alert: UIAlertController, controller: UIViewController) {
        
        if UIDevice.isIPad {
            controller.popoverPresentationController?.sourceView = controller.view
            controller.popoverPresentationController?.sourceRect = CGRect(x: controller.view.bounds.size.width / 2.0, y: controller.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
        }
        
        DispatchQueue.main.async {
            controller.present(alert, animated: true, completion: {
                alert.view.tintColor = UIColor.appBasic
            })
        }
    }
    
}
