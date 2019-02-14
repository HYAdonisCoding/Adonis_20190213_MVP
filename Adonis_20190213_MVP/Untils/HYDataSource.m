//
//  HYDataSource.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYDataSource.h"

@interface HYDataSource ()
/** block */
@property (nonatomic, copy) TableViewDataSourceBlock block;

/** 数据 */
@property (nonatomic, copy) NSArray *dataArray;
/** 标识 */
@property (nonatomic, copy) NSString *identifier;


@end

@implementation HYDataSource

- (instancetype)initWithIdentifier:(NSString *)identifier configBlock:(TableViewDataSourceBlock)block {
    self = [super init];
    if (self) {
        self.identifier =identifier;
        self.block = [block copy];
    }
    return self;
}

- (void)addDataArray:(NSArray *)dataArray {
    self.dataArray = dataArray;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    self.block(cell, self.dataArray[indexPath.row], indexPath);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


@end
