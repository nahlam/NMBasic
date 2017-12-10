//
//  UIImage+Resize.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/2/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation

import UIKit

public extension UIImage {
    
    public func nm_resizeImage (size: CGSize) -> UIImage {
        
        let image = nm_resizeWith(width: size.width)
        return image == nil ? self : image!
    }
    
    public func nm_resize(size:CGSize, completionHandler:@escaping (_ resizedImage:UIImage?, _ data:Data?)->()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let newSize:CGSize = size
            let rect = CGRect(x: 0, y: 0, width: newSize.width,height: newSize.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            self.draw(in: rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageData = UIImageJPEGRepresentation(newImage!, 0.5)
            DispatchQueue.main.async {
                completionHandler(newImage, imageData)
            }
        }
    }
    
    public func nm_resizeImage(newWidth: CGFloat) -> UIImage {
        
        let image = self
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage != nil ? newImage! : image
    }
    
    public func nm_resizeWith(percentage: CGFloat) -> UIImage? {
        
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    public func nm_resizeWith(width: CGFloat) -> UIImage? {
        
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    public func nm_aspectScaled(width: CGFloat) -> UIImage {
        
        let image = self
        let oldWidth = image.size.width
        let scaleFactor = width / oldWidth
        let newHeight = image.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    class func nm_squareImageTo(image: UIImage, size: CGSize) -> UIImage {
        return nm_resizeImage(image: nm_squareImage(image: image), targetSize: size)
    }
    
    class func nm_squareImage(image: UIImage) -> UIImage {
        let originalWidth  = image.size.width
        let originalHeight = image.size.height
        
        var edge: CGFloat
        if originalWidth > originalHeight {
            edge = originalHeight
        } else {
            edge = originalWidth
        }
        
        let posX = (originalWidth  - edge) / 2.0
        let posY = (originalHeight - edge) / 2.0
        
        
        let cropSquare = CGRect(x: posX, y: posY, width: edge, height: edge)
        
        let imageRef = image.cgImage!.cropping(to: cropSquare);
        return UIImage(cgImage: imageRef!, scale: UIScreen.main.scale, orientation: image.imageOrientation)
    }
    
    class func nm_resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            
            newSize = CGSize(width:size.width * heightRatio,height: size.height * heightRatio)
        } else {
            newSize = CGSize(width:size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
