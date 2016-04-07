//
//  OrderHeaderView.h
//  OderDemo
//
//  Created by 罗金 on 15/10/27.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FlodCell) (NSDictionary *dic);
@interface OrderHeaderView : UIView

@property (nonatomic, strong) UILabel *orderIdLab;
@property (nonatomic, strong) UILabel *stateLab;
@property (nonatomic, assign) BOOL isShow; // 是否是展开状态
@property (nonatomic ,copy) FlodCell MoreBlock;
@property (nonatomic, strong) UIButton *moreBtn;


- (void)setCellNumber:(NSArray *)array andIsShow:(BOOL)isShow section:(NSInteger)section;

@end
