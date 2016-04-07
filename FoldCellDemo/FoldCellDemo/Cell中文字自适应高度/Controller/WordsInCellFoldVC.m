//
//  WordsInCellFoldVC.m
//  FoldCellDemo
//
//  Created by 罗金 on 16/4/7.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "WordsInCellFoldVC.h"
#import "RemarksTableViewCell.h"
#import "RemarksCellHeightModel.h"

@interface WordsInCellFoldVC ()<UITableViewDataSource, UITableViewDelegate, RemarksCellDelegate>

// 存放cell视图展开状态的字典
@property (nonatomic, strong) NSMutableDictionary *cellIsShowAll;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation WordsInCellFoldVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.cellIsShowAll = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadDataSource];
    [self tableView];

}

#pragma mark - tableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 返回Cell高度
    return [RemarksCellHeightModel cellHeightWith:[self.dataSource objectAtIndex:indexPath.row] andIsShow:[[self.cellIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]] boolValue] andLableWidth:BOUNDS.size.width-30 andFont:12 andDefaultHeight:52 andFixedHeight:42 andIsShowBtn:8];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"meTableViewCell";
    RemarksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[RemarksTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setCellContent:[self.dataSource objectAtIndex:indexPath.row] andIsShow:[[self.cellIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]] boolValue]  andCellIndexPath:indexPath];
    
    return cell;
}

#pragma mark -- Dalegate
- (void)remarksCellShowContrntWithDic:(NSDictionary *)dic andCellIndexPath:(NSIndexPath *)indexPath
{    
    [self.cellIsShowAll setObject:[dic objectForKey:@"isShow"] forKey:[NSString stringWithFormat:@"%@",[dic objectForKey:@"row"]]];
    
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
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)loadDataSource {
    self.dataSource = [[NSMutableArray alloc] init];
    [_dataSource addObject:@"Cell中文字高度自适应啊十分。"];
    
    [_dataSource addObject:@"Cell点开收起会尽快哈十分卡是弗拉斯柯达减肥挥洒的离开回来哈拉哈发神经的发哈龙卷风白金卡拉斯办法是健康的发布拉斯交换机快来撒会分开就老大说废话接口里黄金卡和收割机卡萨离开家黄金卡是刘德华。"];
    
    [_dataSource addObject:@"Cell中文字高度自适应啊十分就爱上恢复健康萨拉丁干红辣椒撒刚回来交水电费。"];
    
    [_dataSource addObject:@"Cell中文字高度自适应啊十分就爱上恢复健康萨拉丁干红辣椒撒刚回来交水电sdgajklsaafjawheafggsadgsdgdshrdhdgasgdsageaerrdfdsgsd。"];
    
    [_dataSource addObject:@"而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我一uegfeuawusi很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个一uyuwegfduhjkghkasgfaysufgyewugfyuewogf九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。"];
    
    [_dataSource addObject:@"古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我一uegfeuawusi很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个一uyuwegfduhjkghkasgfaysufgyewugfyuewogf九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿。"];
    
    [_dataSource addObject:@"发个啊发生九嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦。"];
    
    [_dataSource addObject:@"爱使股份温哥华继往开来嘎哈烧烤就好挂虽有过绯闻我月服务业股份为很快就会发生了开放后无恶意不hiouaFHUOQYRH0WPJFM OGuafoigahsuif。"];
    
    [_dataSource addObject:@"afweiluhgluighejehjfdsuhgsyugysugewuygdfshjkdhjkjgyiugiuyfyughughhihoiuhouihijlhjlihuihiugkhuigyuifgtuyjguykghkuyguiygiyfygfigjhvgigiuyhbjkbiuhiuhjkhnjkhiu。"];
    
    [_dataSource addObject:@"jlhjlihuihiugkhuigyuifgtuyjguykghkuyguiygiyfygfigjhvgigiuyhbjkbiuhiuhjkhnjkhiu。。。"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
