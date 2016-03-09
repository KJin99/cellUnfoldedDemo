//
//  OrderHeaderView.m
//  OderDemo
//
//  Created by 罗金 on 15/10/27.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import "OrderHeaderView.h"

@interface OrderHeaderView()

@property (nonatomic, assign) NSInteger section;

@end

@implementation OrderHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.moreBtn = [[UIButton alloc] init];
        [self.moreBtn addTarget:self action:@selector(footerButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _moreBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:self.moreBtn];
        
        self.orderIdLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 21, 150, 18)];
        _orderIdLab.textAlignment = NSTextAlignmentLeft;
        _orderIdLab.font = [UIFont systemFontOfSize:18];
        [self addSubview:_orderIdLab];
        
        self.stateLab = [[UILabel alloc] init];
        _stateLab.textAlignment = NSTextAlignmentRight;
        _stateLab.textColor = [UIColor orangeColor];
        _stateLab.font = [UIFont systemFontOfSize:20];
        [self addSubview:_stateLab];
        [_stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_orderIdLab.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-10);
        }];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(15, 59, BOUNDS.size.width-30, 1)];
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
    }
    return self;
}

- (void)setCellNumber:(NSArray *)array andIsShow:(BOOL)isShow section:(NSInteger)section
{
    self.section = section;
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height);
    }];
    
}


- (void)footerButtonAction
{
    NSLog(@"显示所有cell");
    
    self.moreBtn.selected = !self.moreBtn.selected;
    NSLog(@"selected===%zi", self.moreBtn.selected);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithBool:self.moreBtn.selected] forKey:@"isShow"];
    [dic setObject:[NSNumber numberWithInteger:self.section] forKey:@"section"];
    self.MoreBlock (dic);
    
}



@end
