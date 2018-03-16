//
//  CircleImageViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/16.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "CircleImageViewController.h"
#import "TableViewCell.h"
#import "UIImage+Addtion.h"
#import "UIImageView+CornerRadius.h"


@interface CircleImageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation CircleImageViewController
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
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
    NSArray *array = @[@"清除缓存",@"查看详情",@"系统通知",@"好友消息",@"系统设置"];
    _dataArray = [NSMutableArray arrayWithArray:array];
    [_tableView reloadData];
}
- (void)createTableView{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
}


#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1000;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    
   /*
    [cell.circleImageView zy_cornerRadiusRoundingRect];
    [cell.circleImageView2 zy_cornerRadiusRoundingRect];
    [cell.circleImageView3 zy_cornerRadiusRoundingRect];
*/

    cell.circleImageView.image = [UIImage imageNamed:@"JI-1-段-9.jpg"] ;
    cell.circleImageView2.image = [UIImage imageNamed:@"JI-1-段-9.jpg"];
    cell.circleImageView3.image = [UIImage imageNamed:@"JI-1-段-9.jpg"];
    
    cell.circleImageView.layer.masksToBounds = YES;
    cell.circleImageView.layer.cornerRadius = 40;
    cell.circleImageView2.layer.masksToBounds = YES;
    cell.circleImageView2.layer.cornerRadius = 40;
    cell.circleImageView3.layer.masksToBounds = YES;
    cell.circleImageView3.layer.cornerRadius = 40;
    cell.circleImageView.layer.borderWidth = 2;
    cell.circleImageView2.layer.borderWidth = 2;
    cell.circleImageView3.layer.borderWidth = 2;
    
    
    
    /*
    //初始化CAShapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //设置shapeLayer路径和圆角弧度
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:
                       cell.circleImageView.bounds cornerRadius:40].CGPath;
    //设置ImageView的蒙版
    cell.circleImageView.layer.mask = shapeLayer;
     */
    
    //[cell.circleImageView.image imageWithCornerRadius:40];
    
    
    return cell;
}

#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
