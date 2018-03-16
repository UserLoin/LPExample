//
//  TableViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/4.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "TableViewController.h"
#import "Masonry.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation TableViewController
#pragma mark - 懒加载
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
        
        // 预防tableView里面cell的高度变化
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}
#pragma mark- 页面加载
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self createTableView];
    [self createData];
}

#pragma mark- 加载数据
- (void)createData{
    NSArray *array = @[@"清除缓存",@"查看详情",@"系统通知",@"好友消息",@"清除缓存",@"查看详情",@"系统通知",@"好友消息",@"清除缓存",@"查看详情",@"系统通知",@"好友消息",@"清除缓存",@"查看详情",@"系统通知",@"好友消息",@"清除缓存",@"查看详情",@"系统通知",@"好友消息"];
    _dataArray = [NSMutableArray arrayWithArray:array];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView reloadData];

    });
}
- (void)createTableView{
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%s", __FUNCTION__);
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s", __FUNCTION__);
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __FUNCTION__);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%@",(long)indexPath.row,_dataArray[indexPath.row]]
    ;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s%@", __FUNCTION__,indexPath);
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSLog(@"%s", __FUNCTION__);
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSLog(@"%s", __FUNCTION__);
    return 0.1;
}
- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {

        if (@available(iOS 11.0, *)) {
            make.edges.mas_equalTo(self.view.safeAreaInsets);
        } else {
            make.edges.equalTo(self.view);
        }
        
    }];
     
}
@end
