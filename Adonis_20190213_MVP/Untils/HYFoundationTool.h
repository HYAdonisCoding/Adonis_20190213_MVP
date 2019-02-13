//
//  HYFoundationTool.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYFoundationTool : NSObject

/**
 获取手机型号
 
 @return 获取手机型号
 */
+ (NSString *)getCurrentDeviceModel;

/**
 获取本机的IP地址
 
 @return IP地址
 */
+ (NSString *)getIPAddress;

/**
 获取Label的高度
 
 @param width 宽度
 @param string 字符串
 @return 高度
 */
+ (CGFloat)labelHeightForWidth:(CGFloat)width string:(NSString *)string;
/**
 获取Label宽度
 
 @param text Label文字
 @param fontSize 字体大小
 @return Label大小
 */
+ (CGSize)getAttributeSizeWithText:(NSString *)text fontSize:(CGFloat)fontSize;

//字典转字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

//字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;



/**
 xml字段特殊字符转换
 
 @param string 原始字符串
 @return 转后的字符串
 */
+ (NSString *)convertSpecialCharacters:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
