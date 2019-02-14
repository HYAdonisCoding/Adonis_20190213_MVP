//
//  HYDataSource.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYDataSource : HYBaseModel <UITableViewDataSource>

- (instancetype)initWithIdentifier:(NSString *)identifier configBlock:(TableViewDataSourceBlock)block;

- (void)addDataArray:(NSArray *)dataArray;
@end

NS_ASSUME_NONNULL_END
