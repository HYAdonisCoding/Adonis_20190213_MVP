//
//  HYBaseNavigationController.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseNavigationController : UINavigationController

///自定义push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

///自定义pop
- (void)popViewControllerAnimated:(BOOL)animated;

///自定义popToRoot
- (void)popToRootViewControllerAnimated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
