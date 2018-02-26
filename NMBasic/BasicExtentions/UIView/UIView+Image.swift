//
//  UIView+Image.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 2/22/18.
//  Copyright © 2018 Nahla Mortada. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public func getImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
            defer { UIGraphicsEndImageContext() }
            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            self.layer.render(in: currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
    }
    
    
    public func share(viewController: UINavigationController?) {
        if let image = self.getImage() {
            CommunicationManager.share(text: "", image: image, url: nil, viewController: viewController)
        }
    }
}
