//
//  UIView+HUD.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "UIView+HUD.h"
#import <SVProgressHUD.h>

#define kShowWarningDelayDuration   1
#define kShowWarningDelayDurationD   0.15
#define kTimeoutDuration 15

@implementation UIView (HUD)
/** 显示忙提示 */
- (void)showBusyHUD {
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleDark)];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [SVProgressHUD setDefaultAnimationType:(SVProgressHUDAnimationTypeNative)];
    [SVProgressHUD setMinimumSize:CGSizeMake(80, 80)];
    [SVProgressHUD setContainerView:self];
    //        [SVProgressHUD setViewForExtension:self];
    //        [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, -100)];
    //        [SVProgressHUD dismissWithDelay:kTimeoutDuration];
    //    });
}

/** 隐藏忙提示 */
- (void)hideBusyHUD {
    //    dispatch_async(dispatch_get_main_queue(), ^{
    
    [SVProgressHUD dismiss];
    //    });
}

/** 显示文字提示 */
- (void)showWarning:(NSString *)words {
    //为使用者考虑, 如果子线程执行此方法会崩溃, 我们要把方法做成线程安全的.
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [SVProgressHUD showImage:[UIImage imageNamed:@"wrt424erte2342rx"] status:words];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack]; //设置HUD背景图层的样式
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setBackgroundLayerColor:[UIColor clearColor]];
    [SVProgressHUD setCornerRadius:10];
    [SVProgressHUD setMinimumSize:CGSizeMake(80, 50)];
    [SVProgressHUD setContainerView:self];
    //        [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 100)];
    [SVProgressHUD dismissWithDelay:words.length * kShowWarningDelayDurationD + 0.5];
    //    });
}

- (void)showWarning:(NSString *)words completionHandler:(void(^)(id hud))completionHandler {
    //为使用者考虑, 如果子线程执行此方法会崩溃, 我们要把方法做成线程安全的.
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [SVProgressHUD dismiss];
    [SVProgressHUD showWithStatus:words];
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleDark)];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [SVProgressHUD setDefaultAnimationType:(SVProgressHUDAnimationTypeNative)];
    [SVProgressHUD setMinimumSize:CGSizeMake(80, 80)];
    [SVProgressHUD setContainerView:self];
    //        [SVProgressHUD setViewForExtension:self];
    //        [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 100)];
    
    [SVProgressHUD dismissWithDelay:words.length * kShowWarningDelayDurationD + 0.5 completion:^{
        if (completionHandler) {
            completionHandler(nil);
        }
    }];
    
    //    });
    
}


/** 显示成功文字提示 */
- (void)showSuccess:(NSString *)words completionHandler:(void(^)(id hud))completionHandler {
    //    dispatch_async(dispatch_get_main_queue(), ^{
    [SVProgressHUD dismiss];
    [SVProgressHUD showSuccessWithStatus:words];
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleDark)];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [SVProgressHUD setDefaultAnimationType:(SVProgressHUDAnimationTypeNative)];
    [SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
    [SVProgressHUD setContainerView:self];
    //        [SVProgressHUD setViewForExtension:self];
    //        [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 100)];
    
    [SVProgressHUD dismissWithDelay:words.length * kShowWarningDelayDurationD + 0.5 completion:^{
        if (completionHandler) {
            completionHandler(nil);
        }
    }];
    
    //    });
    
}

@end
