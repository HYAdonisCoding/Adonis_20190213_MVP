//
//  HYShoppingCartPresent.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYShoppingCartPresent.h"

@implementation HYShoppingCartPresent


- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)didClickedAddButtonWithNum:(NSString *)number indexPath:(NSIndexPath *)indexPath {
    //效验 
    if (indexPath.row < self.dataArray.count) {
        HYShoppingCartModel *model = self.dataArray[indexPath.row];
        model.number = number;
    }
    
    if ([number integerValue] > 98) {
        [self.dataArray removeObjectsInRange:NSMakeRange(0, 4)];
        if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
            [self.delegate reloadUI];
        }
    }
}

- (void)loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    self.dataArray = [NSArray yy_modelArrayWithClass:[HYShoppingCartModel class] json:jsonData].mutableCopy;
}
@end
