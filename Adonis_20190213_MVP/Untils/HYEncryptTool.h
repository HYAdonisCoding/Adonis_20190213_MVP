//
//  HYEncryptTool.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYEncryptTool : NSObject

/**
 公钥加密 可加密中文
 
 @param str 明文
 @param pubKey 公钥
 @return 密文
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 中文转Unicode
 
 @param string 中文原文
 @return Unicode
 */
+ (NSString *)utf8ToUnicode:(NSString *)string;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 */
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;

/// SM4加密
+ (NSString *)encryptSM4String:(NSString *)plaint key:(NSString *)sm4Key;

/// sm4解密
+ (NSString *)decryptSM4String:(NSString *)secret key:(NSString *)sm4Key;

@end

NS_ASSUME_NONNULL_END
