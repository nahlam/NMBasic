#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+Hashes.h"
#import "UIImage+Orientation.h"

FOUNDATION_EXPORT double NMBasicVersionNumber;
FOUNDATION_EXPORT const unsigned char NMBasicVersionString[];

