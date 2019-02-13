//
//  HYHeaderPrefix.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#ifndef HYHeaderPrefix_h
#define HYHeaderPrefix_h

#ifdef __OBJC__

#import <Masonry.h>
#import <MJRefresh.h>
#import <YYModel.h>
#import <FMDB.h>

#import "UIColor+HYSetColor.h"


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

//系统版本
#define SystemVersion [UIDevice currentDevice].systemVersion.floatValue


//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

// 判断是否是iPhone X
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//判断IS_IPHONE_Xr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//判断IS_IPHONE_Xs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//判断IS_IPHONE_Xs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

// 状态栏高度
#define kHYStatusBarHeight ((IS_IPHONE_X || IS_IPHONE_Xs || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? 44.f : 20.f)
// tabBar高度
#define kHYTabBarHeight ((IS_IPHONE_X || IS_IPHONE_Xs || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? (49.f+34.f) : 49.f)
//高度系数812.0是iPhone X的高度
#define kHYHeightCoefficient ((IS_IPHONE_X || IS_IPHONE_Xs || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? 812.0/667.0 : SCREENHEIGHT/SCREENHEIGHT)


//长度系数
#define kHYLongCoefficient SCREENWIDTH / 414

//导航栏高度
#define kHYSafeAreaTopHeight ((IS_IPHONE_X || IS_IPHONE_Xs || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? 88 : 64)
//底部高度
#define kHYAreaBottomHeight ((IS_IPHONE_X || IS_IPHONE_Xs || IS_IPHONE_Xr || IS_IPHONE_Xs_Max) ? 34 : 0)


#endif

#endif /* HYHeaderPrefix_h */
