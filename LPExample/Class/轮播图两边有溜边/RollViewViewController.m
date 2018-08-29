//
//  RollViewViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/6/5.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "RollViewViewController.h"
#import "RollView.h"
#import "DCCycleScrollView.h"
#import "ViewController.h"

@interface RollViewViewController ()<RollViewDelegate,DCCycleScrollViewDelegate>
@property (nonatomic, strong) RollView *rollView;
@property(nonatomic, strong) DCCycleScrollView *banner;

@end


@implementation RollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatPicRollView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.banner adjustWhenControllerViewWillAppera];
}
-(void)creatPicRollView{
    
    
    /*第一种两边带间隙的轮播*/
    self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150) withDistanceForScroll:20.0f withGap:8.0f];
    
    /** 全屏宽滑动 视图之间间隙,  将 Distance 设置为 -12.0f */
    // self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 150) withDistanceForScroll: -12.0f withGap:8.0f];
    // self.rollView.backgroundColor = [UIColor blackColor];
    
    self.rollView.delegate = self;
    [self.view addSubview:self.rollView];
    NSArray *arr = @[@"11.jpg",
                     @"22.jpg",
                     @"33.jpg"];
    [self.rollView rollView:arr];
    
    
    
    /*第二种两边带间隙的轮播*/
    NSArray *bannerArray_H = @[@"11.jpg",
                               @"22.jpg",
                               @"33.jpg"];
    DCCycleScrollView *banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 150) shouldInfiniteLoop:YES imageGroups:bannerArray_H];
    //banner.placeholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];
    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage.jpg"];
    banner.autoScrollTimeInterval = 5;
    banner.autoScroll = YES;
    banner.isZoom = YES;
    banner.imgCornerRadius = 4;
    //banner.itemWidth = [UIScreen mainScreen].bounds.size.width - 40;
    banner.itemSpace = 10;
    banner.betweenGap = 20;
    banner.delegate = self;
    banner.isZoom = YES;
    [self.view addSubview:banner];
    self.banner = banner;
}

#pragma mark - RollViewDelegate
-(void)didSelectPicWithIndexPath:(NSInteger)index{
    if (index != -1) {
        NSLog(@"%ld", (long)index);
    }
    
}
#pragma mark - DCCycleScrollViewDelegate
// 点击图片的代理
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"index = %ld",index);
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
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
