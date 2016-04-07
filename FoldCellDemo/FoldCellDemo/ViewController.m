//
//  ViewController.m
//  FoldCellDemo
//
//  Created by 罗金 on 15/11/25.
//  Copyright © 2015年 EasyFlower. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"点开收起";
    [self loadDataSource];
    [self tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark - tableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify"];
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", indexPath.row+1, [dic objectForKey:@"title"]];
    cell.selectionStyle = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    
    Class typeVC = NSClassFromString([dic objectForKey:@"controller"]);
    UIViewController *typeController = [[typeVC alloc] init];
    typeController.title = [dic objectForKey:@"title"];
    
    [self.navigationController pushViewController:typeController animated:YES];
}


#pragma mark - LAyoutUI

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentify"];
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)loadDataSource {
    self.dataSource = [[NSMutableArray alloc] init];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Cell点开收起", @"title", @"FoldCellViewController", @"controller", nil];
    [_dataSource addObject:dic1];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Cell中文字高度自适应", @"title", @"WordsInCellFoldVC", @"controller", nil];
    [_dataSource addObject:dic2];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"整个TableView中只有一个Cell有展开收起功能", @"title", @"OneCellFoldViewController", @"controller", nil];
    [_dataSource addObject:dic3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
