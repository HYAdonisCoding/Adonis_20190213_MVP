//
//  UIView+HUD.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUD)
/** 显示忙提示 */
- (void)showBusyHUD;

/** 隐藏忙提示 */
- (void)hideBusyHUD;

/** 显示文字提示 */
- (void)showWarning:(NSString *)words;
/** 显示忙文字提示 */
- (void)showWarning:(NSString *)words completionHandler:(void(^)(id hud))completionHandler;


/** 显示成功文字提示 */
- (void)showSuccess:(NSString *)words completionHandler:(void(^)(id hud))completionHandler;

@end

NS_ASSUME_NONNULL_END
