//
//  HYShoppingCartPresent.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYShoppingCartModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HYShoppingCartDelegate <NSObject>

@optional
- (void)didClickedAddButtonWithNum:(NSString *)number indexPath:(NSIndexPath *)indexPath;

- (void)reloadUI;

@end

@interface HYShoppingCartPresent : NSObject<HYShoppingCartDelegate>

/** 代理  */
@property (nonatomic, weak) id<HYShoppingCartDelegate> delegate;
/** 数据 */
@property (nonatomic, strong) NSMutableArray *dataArray;

/** 获取数据 */
- (void)loadData;
@end

NS_ASSUME_NONNULL_END
