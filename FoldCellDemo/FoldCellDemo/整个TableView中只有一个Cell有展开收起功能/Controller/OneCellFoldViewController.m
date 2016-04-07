//
//  OneCellFoldViewController.m
//  FoldCellDemo
//
//  Created by 罗金 on 16/4/7.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "OneCellFoldViewController.h"
#import "RemarksCellHeightModel.h"
#import "RemarksTableViewCell.h"

@interface OneCellFoldViewController ()<UITableViewDataSource, UITableViewDelegate, RemarksCellDelegate>

{
    BOOL _isShow; // 是否展开
    NSString *_cellContentStr; // 备注消息
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation OneCellFoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadDataSource];
    [self tableView];
    
}

#pragma mark - tableView Delegate && DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 174;
    } else if (indexPath.section == 1) {
        return [RemarksCellHeightModel cellHeightWith:_cellContentStr andIsShow:_isShow andLableWidth:BOUNDS.size.width-30 andFont:12 andDefaultHeight:52 andFixedHeight:42 andIsShowBtn:8];
    } else {
        return 38;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *inder = @"Cell1";
    static NSString *Identifier = @"Cell3";
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inder];
        }
        
        cell.textLabel.text = @"Cell1";
        cell.backgroundColor = [UIColor yellowColor];
        
        return cell;
        
    } else if(indexPath.section == 1) {
        static NSString *cellName = @"meTableViewCell";
        RemarksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[RemarksTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell setCellContent:_cellContentStr andIsShow:_isShow  andCellIndexPath:indexPath];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            
        }
        
        cell.textLabel.text = @"Cell2";
        cell.backgroundColor = [UIColor redColor];
        
        return cell;
    }

}

#pragma mark -- Dalegate
- (void)remarksCellShowContrntWithDic:(NSDictionary *)dic andCellIndexPath:(NSIndexPath *)indexPath
{
    _isShow = [[NSString stringWithFormat:@"%@",[dic objectForKey:@"isShow"]] boolValue];
    
    [_tableView reloadData];
}

#pragma mark - LAyoutUI

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell1"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell3"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)loadDataSource {
    _cellContentStr = @"而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我一uegfeuawusi很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个一uyuwegfduhjkghkasgfaysufgyewugfyuewogf九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。";
}

@end
