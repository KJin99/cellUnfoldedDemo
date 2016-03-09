//
//  MyNavigationButton.m
//  EasyFlowerCustomer
//
//  Created by 赵宇 on 15/5/12.
//  Copyright (c) 2015年 chenglin.zhao. All rights reserved.
//

#import "MyNavigationButton.h"

@implementation MyNavigationButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
/**
 *
 重写高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}
- (void)setImageStr:(NSString *)imageStr

{
    _imageStr = imageStr;
    [self setBackgroundImage:[UIImage imageNamed:_imageStr] forState:UIControlStateNormal];
}





@end
