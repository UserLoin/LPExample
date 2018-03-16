//
//  UnFoldViewController.m
//  LPExample
//
//  Created by 罗盼 on 2017/10/11.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "UnFoldViewController.h"

typedef NS_ENUM(NSInteger, SectionFold) {
    SectionIsClosed = 0,//收起
    SectionIsUnFold //合拢
};

@interface UnFoldViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *sectionArray;
@property (nonatomic,strong)NSMutableArray *flagArray;
@end

@implementation UnFoldViewController

#pragma mark- 页面加载
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title =@"首页";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    //加载数据
    [self loadData];
}

#pragma mark- 加载数据
- (void)loadData{
    _sectionArray = [NSMutableArray array];
    _flagArray  = [NSMutableArray array];
    NSInteger num = 6;
    for (int i = 0; i < num; i ++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j < arc4random()%20 + 1; j ++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d",j]];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@(SectionIsClosed)];
    }
    
    //开始falgArray=[0,0,0,0,0,0],sectionArray=[{},{},{}]
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _sectionArray[section];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * str = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text= [NSString stringWithFormat:@"第%ld组的第%ld个cell",(long)indexPath.section,(long)indexPath.row];
    cell.clipsToBounds = YES; //这句话很重要
    return cell;
}

#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_flagArray[indexPath.section] intValue] == SectionIsClosed)
        return 0;
    else
        return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, self.view.frame.size.width, 444);
        label.textColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"组%ld",(long)section];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 100 + section;
        label.userInteractionEnabled = YES;
        label.backgroundColor = [UIColor yellowColor];
        label;
    });
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [sectionLabel addGestureRecognizer:tap];
    
    return sectionLabel;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",[NSString stringWithFormat:@"第%ld组的第%ld个cell",(long)indexPath.section,(long)indexPath.row]);
}

//手势点击事件
- (void)sectionClick:(UITapGestureRecognizer *)tap{
    
    long index = tap.view.tag - 100;
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = _sectionArray[index];
    for (int i = 0; i < arr.count; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    
    if ([_flagArray[index] intValue] == SectionIsClosed) {//展开
        _flagArray[index] = @(SectionIsUnFold);
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句
    } else { //收起
        _flagArray[index] = @(SectionIsClosed);
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句
    }
    
    //NSRange range = NSMakeRange(index, 1);
    //NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    //[_tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
