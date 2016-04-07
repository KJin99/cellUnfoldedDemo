//
//  OrderCell.m
//  OderDemo
//
//  Created by 罗金 on 15/10/27.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BOUNDS.size.width, 35)];
        backView.backgroundColor = CLColor(219, 219, 219);
        [self.contentView addSubview:backView];
        
        self.nameLab = [[UILabel alloc] init];
        _nameLab.textAlignment = NSTextAlignmentLeft;
        _nameLab.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLab];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backView.mas_left).offset(10);
            make.top.mas_equalTo(backView.mas_top).offset(8);
            make.height.mas_equalTo(15);
        }];
        
        self.numberLab = [[UILabel alloc] init];
        _numberLab.font = [UIFont systemFontOfSize:13];
        _numberLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_numberLab];
        [_numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(backView.mas_right).offset(-8);
            make.top.mas_equalTo(backView.mas_top).offset(11);
        }];
        
        self.moneyLab = [[UILabel alloc] init];
        _moneyLab.font = [UIFont systemFontOfSize:15];
        _moneyLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_moneyLab];
        [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_numberLab.mas_left).offset(-3);
            make.bottom.mas_equalTo(_numberLab.mas_bottom);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
