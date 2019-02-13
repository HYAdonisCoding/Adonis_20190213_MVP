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

@interface HYShoppingCartController ()<UITableViewDelegate, UITableViewDataSource, HYShoppingCartDelegate>
/** 数据 */
@property (nonatomic, copy) NSArray *dataArray;
/** 列表 */
@property (nonatomic, strong) UITableView *tableView;

/** present */
@property (nonatomic, strong) HYShoppingCartPresent *present;
/** <#Description#> */
@property (nonatomic, strong) HYDataSource *dataSource;

@end

@implementation HYShoppingCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的购物车";
    //获取数据
    self.present = [HYShoppingCartPresent alloc];
    self.present.delegate = self;
    [self.present loadData];
    self.dataArray = self.present.dataArray; 
    
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //注册cell
    [self.tableView registerClass:[HYShoppingCartCell class]];
}

#pragma mark - HYShoppingCartDelegate
- (void)reloadUI {
    self.dataArray = self.present.dataArray;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HYShoppingCartCell class]) forIndexPath:indexPath];
    HYShoppingCartModel *model = self.dataArray[indexPath.row];
    cell.nameLabel.text = model.name;
    cell.numberLabel.text = model.number;
    cell.indexPath = indexPath;
    cell.delegate = self.present;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -- Lazy Load

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[];
    }
    return _dataArray;
}
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
