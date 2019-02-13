//
//  SM4EncodeAndDecode.h
//  officialDemo2D
//
//  Created by yfc on 16/6/15.
//  Copyright © 2016年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sm4.h"
#import "sm4test.h"

@interface SM4EncodeAndDecode : NSObject

//  + (NSString *)decodeJieMi:(NSString*)base64Str;

+ (NSString *)decodeJieMi:(NSString *)base64Str AndKeyStr:(NSString *)keyStr;

@end
