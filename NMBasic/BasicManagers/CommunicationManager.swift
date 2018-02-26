//
//  CommunicationManager.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 2/22/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit
import MessageUI

open class CommunicationManager: NSObject {

    open class func sms(number: String, body: String, delegate: MFMessageComposeViewControllerDelegate) {
        if !MFMessageComposeViewController.canSendText() {
        UIAlertController.showErrorAlert(String.localized(key:NMBasicManager.Strings.Error.SMSError))
            return
        }
        let recipents = [number]
        if !UIDevice.isIPad {
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate = delegate
            messageController.recipients = recipents
            messageController.body = body
            DispatchQueue.main.async {
                UIViewController.topMostViewController().present(messageController, animated: true, completion: { _ in })
            }
        }
    }
    
    
    
    
    open class func share(text: String, image: UIImage?, url: URL?,viewController: UINavigationController?) {
        var sharingItems = [Any]()
        if text != "" {
            sharingItems.append(text)
        }
        if image != nil {
            sharingItems.append(image!)
        }
        if url != nil {
            sharingItems.append(url!)
        }
        let activityController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        if activityController.popoverPresentationController != nil  {
            // iOS8
            activityController.popoverPresentationController?.sourceView = viewController?.view
            if var rect = viewController?.view.frame {
                let screenRect = UIScreen.main.bounds
                let screenWidth: CGFloat = screenRect.size.width
                rect.origin.x = screenWidth / 2 - 50
                rect.origin.y = viewController!.view.frame.size.height / 4 - 50
                activityController.popoverPresentationController?.sourceRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: 100, height: 100)
                activityController.popoverPresentationController?.permittedArrowDirections = .up
            }
        }
        DispatchQueue.main.async {
            if viewController != nil {
                viewController?.present(activityController, animated: true, completion: { _ in })
            }else {
                let navigation =  UIViewController.currentViewController()
                navigation.present(activityController, animated: true, completion: { _ in })
                
            }
            
        }
    }
    
}
