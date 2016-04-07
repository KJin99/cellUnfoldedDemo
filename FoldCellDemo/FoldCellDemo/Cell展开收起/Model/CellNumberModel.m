//
//  CellNumberModel.m
//  OderDemo
//
//  Created by 罗金 on 15/10/26.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import "CellNumberModel.h"

@implementation CellNumberModel

+ (NSInteger)cellNumberWith:(NSArray *)array andIsShow:(BOOL)isShow{
    // 判断传进来的数组中元素的个数是否大于设定的值
    // 大于则根据footerView的展开收起按钮，来控制cell的个数
    
    if (array.count > MAXNUMBER) {
        if (isShow) {
            // 展开状态下显示数组中的所有元素
            return array.count;
        }else{
            // 收起状态下只显示预先设定的个数
            return MAXNUMBER;
        }
    }else{
        // 小于预先设定的数值，则展示数组中的所有元素
        return array.count;
    }
    
    return 0;
}

@end
