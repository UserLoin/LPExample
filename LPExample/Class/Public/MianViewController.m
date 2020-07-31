//
//  MianViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/1.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "MianViewController.h"
#import "ExampleModel.h"
#import "FirstViewController.h"
#import "NSMutableAttributedStringVC.h"
#import "TableViewController.h"
#import "ImageViewController.h"
#import "SelectBarViewController.h"
#import "NewCreateViewViewController.h"
#import "CircleImageViewController.h"
#import "MarqueeViewController.h"
#import "KVOViewController.h"
#import "CaculatorMakerViewController.h"
#import "RACViewController.h"
#import "UnFoldViewController.h"
#import "ReduceTimeViewController.h"
#import "YYCacheViewController.h"
#import "EmptyDataViewController.h"
#import "AdaptTableViewController.h"
#import "BlackPageViewController.h"
#import "SPTipTestViewController.h"
#import "SectionFoldViewController.h"
#import "RollViewViewController.h"
#import "ADViewController.h"
#import "CTStopCarExampleViewController.h"
#import "ManyRequestViewController.h"
#import "ShadowViewController.h"
#import "AnimationViewController.h"
#import "LiMingDemoViewController.h"
#import "TimerViewController.h"

@interface MianViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;

@property (strong, nonatomic) NSArray *examplesArray;
@end

@implementation MianViewController
#pragma mark - 懒加载
- (NSArray *)examplesArray{
    if (!_examplesArray) {
        ExampleModel *model0 = [[ExampleModel alloc]init];
        model0.header = @"功能模块";
        model0.vcClassArray = @[[FirstViewController class],
                                [NSMutableAttributedStringVC class],
                                [MianViewController class],
                                [TableViewController class],
                                [ImageViewController class],
                                [SelectBarViewController class],
                                [NewCreateViewViewController class],
                                [CircleImageViewController class],
                                [MarqueeViewController class],
                                [KVOViewController class],
                                [CaculatorMakerViewController class],
                                [RACViewController class],
                                [UnFoldViewController class],
                                [ReduceTimeViewController class],
                                [YYCacheViewController class],
                                [EmptyDataViewController class],
                                [AdaptTableViewController class],
                                [BlackPageViewController class],
                                [SPTipTestViewController class],
                                [SectionFoldViewController class],
                                [RollViewViewController class],
                                [ADViewController class],
                                [CTStopCarExampleViewController class],
                                [ManyRequestViewController class],
                                [ShadowViewController class],
                                [AnimationViewController class],
                                [LiMingDemoViewController class],
                                [TimerViewController class],
        ];
        
        model0.titlesArray = @[@"加载WKWebView页面封装",
                               @"简单的图文混排",
                               @"测试自定义cell高度",
                               @"tableView代理的加载顺序",
                               @"ImageView图片的显示方式",
                               @"SelectBarViewController",
                               @"NewCreateViewViewController",
                               @"测试裁圆角",
                               @"跑马灯",
                               @"KVO底层实现+响应式编程",
                               @"链式编程思想-简单计算器",
                               @"RACViewController",
                               @"SectionCell折叠",
                               @"Buttond倒计时",
                               @"YYCache数据存储",
                               @"EmptyData空白数据的显示",
                               @"TableViews适配",
                               @"空白页显示",
                               @"给任何view添加Tip",
                               @"Section展开与折叠",
                               @"轮播图两边带边框",
                               @"轮播图两边带边框-更改",
                               @"自定义停车键盘",
                               @"多请求相关",
                               @"View设置阴影效果",
                               @"iOS动画集合",
                               @"李明demo",
                               @"WeakTimerTest",
        ];
        
        model0.methodsArray = @[@"First",
                                @"Second",
                                @"Third"];
        
        ExampleModel *model1 = [[ExampleModel alloc]init];
        model1.header = @"分类";
        model1.vcClassArray = @[[UIViewController class]];
        model1.titlesArray = @[@"UIViewController+Example"];
        model1.methodsArray = @[@"First"];
        
        ExampleModel *model2 = [[ExampleModel alloc]init];
        model2.header = @"其他";
        model2.vcClassArray = @[[FirstViewController class]];
        model2.titlesArray = @[@"First"];
        model2.methodsArray = @[@"First"];
        
        _examplesArray = @[model0,model1,model2];
    }
    return _examplesArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark- 页面加载
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"MainExample";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.examplesArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ExampleModel *model = self.examplesArray[section];
    return model.titlesArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"detailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    ExampleModel *model = self.examplesArray[indexPath.section];
    cell.textLabel.text = model.titlesArray[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld - %@",indexPath.row+1,model.vcClassArray[indexPath.row]];
    return cell;
}

#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ExampleModel *model = self.examplesArray[section];
    return model.header;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(15, 0, 200, 40);
    label.font = [UIFont boldSystemFontOfSize:14];
    ExampleModel *model = self.examplesArray[section];
    label.text =  model.header;
    [view addSubview:label];
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExampleModel *model = self.examplesArray[indexPath.section];
    UIViewController *vc = [[model.vcClassArray[indexPath.row] alloc] init];
    vc.title = model.titlesArray[indexPath.row];
    
    //利用Runtime动态添加属性方法
    //[vc setValue:model.methodsArray[indexPath.row] forKeyPath:@"method"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
