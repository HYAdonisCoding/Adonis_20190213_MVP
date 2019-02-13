//
//  HYBaseView.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseView.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation HYBaseView

//滚动时不允许确认
- (BOOL)anySubViewScrolling:(UIView *)view {
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        
        UIScrollView *scrollView = (UIScrollView *)view;
        
        if (scrollView.dragging || scrollView.decelerating) {
            return YES;
        }
    }
    
    for (UIView *theSubView in view.subviews) {
        if ([self anySubViewScrolling:theSubView]) {
            return YES;
        }
    }
    return NO;
}

- (void)playSystemSound {
    //    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  // 震动
    // 普通短震，3D Touch 中 Peek 震动反馈
    AudioServicesPlaySystemSound(1519);
    // 普通短震，3D Touch 中 Pop 震动反馈
    //AudioServicesPlaySystemSound(1520);
    // 连续三次短震
    //AudioServicesPlaySystemSound(1521);
    
    
    //    AudioServicesPlaySystemSound(1000);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
