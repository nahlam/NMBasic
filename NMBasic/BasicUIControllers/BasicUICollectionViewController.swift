//
//  BasicUIViewController.swift
//  NMBasic
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

open class BasicUICollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
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
