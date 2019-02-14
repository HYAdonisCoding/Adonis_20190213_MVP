//
//  HYShoppingCartController.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYShoppingCartController.h"
#import "HYShoppingCartCell.h"
#import "UITableView+HYRegister.h"
#import "HYShoppingCartModel.h"
#import "HYShoppingCartPresent.h"
#import "HYDataSource.h"

@interface HYShoppingCartController ()<HYShoppingCartDelegate, UITableViewDelegate>
/** 列表 */
@property (nonatomic, strong) UITableView *tableView;

/** present */
@property (nonatomic, strong) HYShoppingCartPresent *present;
/** 数据处理器 */
@property (nonatomic, strong) HYDataSource *dataSource;

@end

@implementation HYShoppingCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的购物车";
    //获取数据
    self.present = [HYShoppingCartPresent alloc];
    self.present.delegate = self;
    [self.present loadData];
    //注册cell
    [self.tableView registerClass:[HYShoppingCartCell class]];
    WK(weakSelf)
    self.dataSource = [[HYDataSource alloc] initWithIdentifier:NSStringFromClass([HYShoppingCartCell class]) configBlock:^(HYShoppingCartCell *cell, HYShoppingCartModel *model, NSIndexPath *indexPath) {
        SG(strongSelf)
        cell.nameLabel.text = model.name;
        cell.numberLabel.text = model.number;
        cell.indexPath = indexPath;
        cell.delegate = strongSelf.present;
    }];
    [self.dataSource addDataArray:self.present.dataArray];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
}

#pragma mark - HYShoppingCartDelegate
- (void)reloadUI {
    [self.dataSource addDataArray:self.present.dataArray];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = footerView;
        
        //隐藏自带的分割线
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置tableView背景色
        _tableView.backgroundColor = [UIColor whiteColor];
        //估算高度
        _tableView.estimatedRowHeight = 150;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
        }];
    }
    return _tableView;
}


@end
