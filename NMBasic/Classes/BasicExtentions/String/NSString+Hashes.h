//
//  NSString+Hashes.h
//  Q8Car
//
//  Created by nahla on 8/19/15.
//  Copyright (c) 2015 Q8Car. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashes)

@property (nonatomic, readonly) NSString *objec_md5;
@property (nonatomic, readonly) NSString *objec_sha1;
@property (nonatomic, readonly) NSString *objec_base64;
@property (nonatomic, readonly) NSString *objec_urlencode;

- (NSString *)nm_getPhoneWithStars;

@end
