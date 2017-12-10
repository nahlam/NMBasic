import UIKit

public extension UIImage {
	
	// colorize image with given tint color
	// this is similar to Photoshop's "Color" layer blend mode
	// this is perfect for non-greyscale source images, and images that have both highlights and shadows that should be preserved
	// white will stay white and black will stay black as the lightness of the image is preserved
	@objc public func nm_tint(color: UIColor) -> UIImage {
		
		return modifiedImage { context, rect in
			// draw black background - workaround to preserve color of partially transparent pixels
			context.setBlendMode(.normal)
			UIColor.black.setFill()
			context.fill(rect)
			
			// draw original image
			context.setBlendMode(.normal)
            //TODOO remove !
			context.draw(self.cgImage!, in: rect)
			
			// tint image (loosing alpha) - the luminosity of the original image is preserved
			context.setBlendMode(.color)
			color.setFill()
			context.fill(rect)
			
			// mask by alpha values of original image
			context.setBlendMode(.destinationIn)
            
            //TODOO remove !
			context.draw(self.cgImage!, in: rect)
		}
	}
    
    
    public func nm_maskWithColor(color: UIColor) -> UIImage? {
        
        let maskImage = self.cgImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) //needs rawValue of bitmapInfo
        bitmapContext?.clip(to: bounds, mask: maskImage!)
        bitmapContext!.setFillColor(color.cgColor)
        bitmapContext!.fill(bounds)
        
        //is it nil?
        if let cImage = bitmapContext!.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
            return coloredImage
            
        } else {
            return nil
        } 
    }
    
    
	
	// fills the alpha channel of the source image with the given color
	// any color information except to the alpha channel will be ignored
	public func fillAlpha(_ fillColor: UIColor) -> UIImage {
		
		return modifiedImage { context, rect in
			// draw tint color
			context.setBlendMode(.normal)
			fillColor.setFill()
			context.fill(rect)
			
			// mask by alpha values of original image
			context.setBlendMode(.destinationIn)
            //TODOO remove !
			context.draw(self.cgImage!, in: rect)
		}
	}
	
	fileprivate func modifiedImage(_ draw: (CGContext, CGRect) -> ()) -> UIImage {
		
		// using scale correctly preserves retina images
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		let context: CGContext! = UIGraphicsGetCurrentContext()
		assert(context != nil)
		
		// correctly rotate image
		context.translateBy(x: 0, y: size.height);
		context.scaleBy(x: 1.0, y: -1.0);
		
		let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
		
		draw(context, rect)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
        
        //TODOO remove !
		return image!
	}
	
}
