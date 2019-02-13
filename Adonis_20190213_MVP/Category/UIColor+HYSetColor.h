//
//  UIColor+HYSetColor.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HYSetColor)

/**
 设置颜色

 @param hexColor 颜色值
 @return 颜色
 */
+ (UIColor *)getColorFrom:(NSString *)hexColor;
@end

NS_ASSUME_NONNULL_END
