//
//  BasicUIViewController.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class BasicUIViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setInitalUIComponents()
        self.setInitalUIStrings()
        self.navigationController?.delegate = self
        if self.navigationController != nil {
            
            if self.navigationController!.interactivePopGestureRecognizer != nil {
                self.navigationController!.interactivePopGestureRecognizer!.delegate = self;
                self.navigationController!.interactivePopGestureRecognizer!.isEnabled = true
            }
        }
    }
    
    open func setInitalUIStrings ()  {
        
    }
    
    open func setInitalUIComponents()    {
        
    }

    open func reportAnalytics()  {
        
    }
    
    open func manageBanners() {
        
    }
    
    open func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    open func dimissView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    open class func getBackButton(isModal: Bool, color: UIColor = UIColor.appBasic, action: Selector) -> UIBarButtonItem   {
        
        let imageName = isModal ? NMBasicManager.ImagesNames.NormalCloseImage :  NMBasicManager.ImagesNames.NormalBackImage
        let backImage:UIImage = UIImage(named: imageName)!
        let frame:CGRect = CGRect(x: 0,y: 5, width: 20,height: 20)
        let button:UIButton = UIButton(frame: frame)
        button.setBackgroundImage(backImage.nm_tint(color: color), for: UIControlState())
        button.addTarget(self, action:  action, for: UIControlEvents.touchUpInside)
        button.showsTouchWhenHighlighted = true
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        let backButton:UIBarButtonItem = UIBarButtonItem(customView:button)
        backButton.accessibilityLabel = String.localized(key:  NMBasicManager.Strings.BackButtonAccessibilityHintLabel)
        backButton.accessibilityHint = String.localized(key:  NMBasicManager.Strings.BackButtonAccessibilityHint)
        return backButton
    }

    
    open func back() {
        
        if self.navigationController?.popViewController(animated: true) == nil {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    open func addBackButton() {
        let isModal = self.isPresentedModal()
        let basicColor = UIColor.appBasic
        let action = #selector(self.back)
        let backButton = BasicUIViewController.getBackButton(isModal: isModal, color: basicColor, action: action)
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction open func backAction(_ sender: Any) {
        self.back()
    }
    
}
