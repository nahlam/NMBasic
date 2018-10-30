//
//  UIImage+Orientation.h
//  NMBasic
//
//  Created by Nahla Mortada on 11/12/16.
//  Copyright © 2016 Nahla Mortada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Orientation)

+ (UIImage *)scaleAndRotateImage:(UIImage *) image;
+ (NSData *)compressImageDataTo2Mega:(UIImage *)image;
+ (UIImage *)compressImageTo2Mega:(UIImage *)image;
+ (UIImage *)compressImageData:(UIImage *)image megas:(int) megas;
    

@end
