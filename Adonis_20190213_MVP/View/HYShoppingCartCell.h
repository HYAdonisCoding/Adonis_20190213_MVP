//
//  HYShoppingCartCell.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYShoppingCartPresent.h"

NS_ASSUME_NONNULL_BEGIN

@interface HYShoppingCartCell : UITableViewCell

/** 代理  */
@property (nonatomic, weak) id<HYShoppingCartDelegate> delegate;

/** indexPath */
@property (nonatomic, strong) NSIndexPath *indexPath;

/** 标号 */
@property (nonatomic, strong) UILabel *numberLabel;
/** 姓名 */
@property (nonatomic, strong) UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END
