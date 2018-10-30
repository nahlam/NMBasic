//
//  BasicUIViewController.swift
//  BasicFramework
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
    
    @objc open dynamic func setInitalUIStrings ()  {
        
    }
    
    @objc open dynamic func setInitalUIComponents()    {
        
    }

    @objc open dynamic func reportAnalytics()  {
        
    }
    
    @objc open dynamic func manageBanners() {
        
    }
    
    open func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc open dynamic func dimissView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc open dynamic func back() {
        
        if self.navigationController?.popViewController(animated: true) == nil {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc open dynamic func addBackButton() {
        let isModal = self.isPresentedModalFirstView()
        let action = #selector(self.back)
        self.navigationItem.backBarButtonItem = BasicUIViewController.getBackButton(isModal: isModal, action: action)
    }
    
    @IBAction open dynamic func backAction(_ sender: Any) {
        self.back()
    }
    
}
