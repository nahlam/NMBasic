//
//  ProgressOverlayManager.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 2/6/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import UIKit
import MRProgress


/// ProgressOverlayManager is class for showing a blocking UI Progress indicator

open class ProgressOverlayManager: NSObject {

    
    fileprivate var progressView: MRProgressOverlayView?
    
    public static let sharedInstance : ProgressOverlayManager = {
        let instance = ProgressOverlayManager()
        return instance
    }()
    
    
    /// Method for updating progress percentage value as float from 1
    ///
    /// - Parameter percentage: percentage value as float directly less than or equal 1
    public func updateProgress(_ percentage: Float) {
        DispatchQueue.main.async {
            self.progressView?.setProgress(percentage, animated: true)
        }
    }
    
    /// Method for updating progress percentage value as Int from 100
    ///
    /// - Parameter percentage: percentage value as int less than or equal 100
    public func updateProgressIndecator(_ percentage: Int) {
        
        let floatPercentage: Float = Float(percentage / 100)
        DispatchQueue.main.async {
            if floatPercentage < 1 {
                self.progressView?.setProgress(floatPercentage, animated: true)
            }
            
        }
    }
    
    
    
    /// Method for showing "Indeterminate" progress indicator with title message
    public func showProgressIndecator(title: String) {
        DispatchQueue.main.async {
            self.progressView = MRProgressOverlayView()
            self.progressView?.titleLabelText = ""
            self.progressView?.mode = MRProgressOverlayViewMode.indeterminate
            if self.progressView != nil {
                UIApplication.shared.keyWindow!.addSubview(self.progressView!)
            }
            self.progressView?.tintColor = UIColor.appBasic
            self.progressView?.show(true)
        }
        
    }
    
    
    /// Method for showing progress indicator without title
    public func showProgressIndecator() {
        self.showProgressIndecator(title: "")
        
    }
    
    
    /// Method for showing "Determinate Circular" progress indicator with inital percentage and title
    ///
    /// - Parameters:
    ///   - percentage: percentage value as float directly less than or equal 1, default value 0.0
    ///   - title: progress title, default empty
    public func showProgressIndecator(_ percentage: Float = 0.0, title: String = "") {
        DispatchQueue.main.async {
            self.progressView = MRProgressOverlayView()
            self.progressView?.titleLabelText = title
            self.progressView?.mode = MRProgressOverlayViewMode.determinateCircular
            if self.progressView != nil {
                UIApplication.shared.keyWindow!.addSubview(self.progressView!)
            }
            self.progressView?.tintColor = UIColor.appBasic
            self.progressView?.show(true)
            self.progressView?.setProgress(percentage, animated: true)
        }
        
    }
    
    
    
    /// Method to just hide the progress indicator not for deleting it
    public func hideProgressIndicator() {
        DispatchQueue.main.async {
            self.progressView?.mode = MRProgressOverlayViewMode.checkmark
            self.progressView?.hide(true)
        }
        
    }
    
    
    /// Method for deleting the progress indicator
    public func removeProgressIndicator() {
        DispatchQueue.main.async {
            self.progressView?.removeFromSuperview()
            self.progressView = nil
        }
        
    }
    
}
