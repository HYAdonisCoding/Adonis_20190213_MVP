//
//  HYBaseView.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYBaseView : UIView

/**
 是否有子视图在滚动
 
 @param view 视图
 @return 是否滚动
 */
- (BOOL)anySubViewScrolling:(UIView *)view;


/**
 播放声音或者振动
 */
- (void)playSystemSound;

@end

NS_ASSUME_NONNULL_END
