//
//  ViewController.m
//  FoldCellDemo
//
//  Created by 罗金 on 15/11/25.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import "ViewController.h"
#import "OrderHeaderView.h"
#import "OrderCell.h"
#import "CellNumberModel.h"
#import "MyNavigationButton.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    MyNavigationButton * rightBtn;
}
@property (nonatomic, strong) UITableView *orderTable;
@property (nonatomic, strong) NSMutableArray *orderArray;

// 存放头视图展开状态的字典
@property (nonatomic, strong) NSMutableDictionary *sectionIsShowAll;

// 存放头视图的字典
@property (nonatomic, strong) NSMutableDictionary *sectionHeaderView;

@property (nonatomic, copy) NSString *showAll; // YES展示全部，NO收起全部


@end

@implementation ViewController



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sectionIsShowAll = [NSMutableDictionary dictionary];
        self.sectionHeaderView = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.showAll = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"列表";
    
    rightBtn = [[MyNavigationButton alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    [rightBtn setTitle:@"全部展开" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [rightBtn addTarget:self action:@selector(rightBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item2;
    
    [self dataSource];
    [self orderTable];
}

- (void)rightBarButtonItemAction:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"全部展开"]) {
        [sender setTitle:@"全部收起" forState:UIControlStateNormal];
        self.showAll = @"show";
    } else {
        [sender setTitle:@"全部展开" forState:UIControlStateNormal];
        self.showAll = @"close";
    }
    
    for (int i = 0; i < self.sectionHeaderView.count; i++) {
        OrderHeaderView *headerView = [self.sectionHeaderView objectForKey:[NSString stringWithFormat:@"%d", i]];
        if ([self.showAll isEqualToString:@"show"]) {
            NSMutableDictionary *showDic = [NSMutableDictionary dictionary];
            [showDic setObject:[NSNumber numberWithBool:1] forKey:@"isShow"];
            [showDic setObject:[NSNumber numberWithInteger:i] forKey:@"section"];
            headerView.MoreBlock(showDic);
            headerView.moreBtn.selected = 1;
        } else if ([self.showAll isEqualToString:@"close"]) {
            NSMutableDictionary *closeDic = [NSMutableDictionary dictionary];
            [closeDic setObject:[NSNumber numberWithBool:0] forKey:@"isShow"];
            [closeDic setObject:[NSNumber numberWithInteger:i] forKey:@"section"];
            headerView.MoreBlock(closeDic);
            headerView.moreBtn.selected = 0;
        }
        
    }
    
}

- (void)dataSource
{
    self.orderArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OrderList" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _orderArray = [dic objectForKey:@"orderArray"];
}

- (UITableView *)orderTable
{
    if (!_orderTable) {
        self.orderTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _orderTable.delegate = self;
        _orderTable.dataSource = self;
        _orderTable.sectionFooterHeight = 0.0000001;
        _orderTable.backgroundColor = [UIColor whiteColor];
        _orderTable.separatorStyle = NO;
        [_orderTable registerClass:[OrderCell class] forCellReuseIdentifier:@"orderCell"];
        [self.view addSubview:_orderTable];
    }
    return _orderTable;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [_orderArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    OrderHeaderView *headerView = [self.sectionHeaderView objectForKey:[NSString stringWithFormat:@"%lu", section]];
    if (headerView == nil) {
        headerView = [[OrderHeaderView alloc] initWithFrame:CGRectMake(0, 0, BOUNDS.size.width, 20)];
        [headerView setCellNumber:_orderArray andIsShow:[[self.sectionIsShowAll objectForKey:@"section"] boolValue] section:section];
        [self.sectionHeaderView setObject:headerView forKey:[NSString stringWithFormat:@"%lu", section]];
    }
    
    NSDictionary *dic = [_orderArray objectAtIndex:section];
    headerView.orderIdLab.text = [dic objectForKey:@"orderId"];
    headerView.stateLab.text = [dic objectForKey:@"title"];
    
    __weak ViewController *weakSelf = self;
    headerView.MoreBlock = ^ (NSDictionary *dic)
    {
        [weakSelf.sectionIsShowAll setObject:[dic objectForKey:@"isShow"] forKey:[NSString stringWithFormat:@"%@",[dic objectForKey:@"section"]]];
        
        NSLog(@"dic====%@", [dic objectForKey:@"section"]);
        NSLog(@"sectionIsShowAll===%@", _sectionIsShowAll);
        
        int showNum = 0;
        int closeNum = 0;
        for (int i = 0; i < self.sectionHeaderView.count; i++) {
            bool selected = [[weakSelf.sectionIsShowAll objectForKey:[NSString stringWithFormat:@"%d",i]] boolValue];
            if (selected == 1) {
                showNum++;
            } else if (selected == 0) {
                closeNum++;
            }
        }
        
        if (showNum == weakSelf.sectionHeaderView.count) {
            [rightBtn setTitle:@"全部收起" forState:UIControlStateNormal];
        } else if (closeNum == weakSelf.sectionHeaderView.count) {
            [rightBtn setTitle:@"全部展开" forState:UIControlStateNormal];
        }
        
        [_orderTable reloadData];
        
    };
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowAr = [[_orderArray objectAtIndex:section] objectForKey:@"array"];
    
    if ([self.sectionIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", section]] == nil) {
        [self.sectionIsShowAll setObject:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"%ld", section]];
    }
    
    return [CellNumberModel cellNumberWith:rowAr andIsShow:[[self.sectionIsShowAll objectForKey:[NSString stringWithFormat:@"%ld", section]] boolValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
    cell.selectionStyle = NO;
    
    NSArray *rowAr = [[_orderArray objectAtIndex:indexPath.section] objectForKey:@"array"];
    NSDictionary *cellDic = [rowAr objectAtIndex:indexPath.row];
    cell.nameLab.text = [cellDic objectForKey:@"name"];
    cell.moneyLab.text = [NSString stringWithFormat:@"￥%@",[cellDic objectForKey:@"sale"]];
    cell.numberLab.text = [NSString stringWithFormat:@"x%@",[cellDic objectForKey:@"num"]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
