//
//  HYShoppingCartCell.m
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/13.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#import "HYShoppingCartCell.h"

#define space 8.0f

@interface HYShoppingCartCell ()

/** 数值 */
@property (nonatomic, assign) NSInteger number;

/** 增加按钮 */
@property (nonatomic, strong) UIButton *increaseButton;
/** 减少按钮 */
@property (nonatomic, strong) UIButton *decreaseButton;

@end

@implementation HYShoppingCartCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeInterface];
        
    }
    return self;
}
- (void)makeInterface {
    
    
    self.increaseButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.increaseButton setTitle:@"＋" forState:(UIControlStateNormal)];
    [self.increaseButton setTitle:@"✚" forState:(UIControlStateSelected)];
    self.increaseButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14.6f];
    [self.increaseButton setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    [self.increaseButton setTitleColor:[UIColor magentaColor] forState:(UIControlStateSelected)];
    self.increaseButton.layer.cornerRadius = 15.0f;
    self.increaseButton.layer.masksToBounds = YES;
    self.increaseButton.backgroundColor = [UIColor getColorFrom:@"#B9B9B9"];
    [self addSubview:self.increaseButton];
    [self.increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20.0f);
        make.size.mas_equalTo(CGSizeMake(30.0f, 30.0f));
        make.centerY.mas_equalTo(0);
    }];
    
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.textColor = [UIColor getColorFrom:(@"#9769a3")];
    self.numberLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14.6f];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(space);
        make.right.mas_equalTo(self.increaseButton.mas_left).offset(-space);
        make.height.mas_equalTo(30.0f);
        make.width.mas_equalTo(60.0f);
    }];
    
    self.decreaseButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.decreaseButton setTitle:@"-" forState:(UIControlStateNormal)];
    [self.decreaseButton setTitle:@"−" forState:(UIControlStateSelected)];
    self.decreaseButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:14.6f];
    [self.decreaseButton setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    [self.decreaseButton setTitleColor:[UIColor magentaColor] forState:(UIControlStateSelected)];
    self.decreaseButton.layer.cornerRadius = 15.0f;
    self.decreaseButton.layer.masksToBounds = YES;
    self.decreaseButton.backgroundColor = [UIColor getColorFrom:@"#B9B9B9"];
    [self addSubview:self.decreaseButton];
    [self.decreaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.numberLabel.mas_left).offset(-space);
        make.size.mas_equalTo(CGSizeMake(30.0f, 30.0f));
        make.centerY.mas_equalTo(0);
    }];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.textColor = [UIColor getColorFrom:(@"#9769a3")];
    self.nameLabel.font = [UIFont fontWithName:@"Courier" size:15.6f];
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(space);
        make.bottom.mas_equalTo(-space);
        make.left.mas_equalTo(20.0f);
        make.height.mas_equalTo(30);
        make.right.mas_lessThanOrEqualTo(self.decreaseButton.mas_left).offset(-space);
    }];

    
    [self.decreaseButton addTarget:self action:@selector(decreaseNumber) forControlEvents:(UIControlEventTouchUpInside)];
    [self.increaseButton addTarget:self action:@selector(increaseNumber) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)increaseNumber {
    self.number = self.numberLabel.text.integerValue;
    if (self.number >= 99) {
        return;
    }
    self.number++;
}

- (void)decreaseNumber {
    self.number = self.numberLabel.text.integerValue;
    if (self.number <= 1) {
        return;
    }
    self.number--;
}


#pragma mark - setter

- (void)setNumber:(NSInteger)number {
    _number = number;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", number];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedAddButtonWithNum:indexPath:)]) {
        [self.delegate didClickedAddButtonWithNum:self.numberLabel.text indexPath:self.indexPath];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
