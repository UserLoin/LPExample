//
//  SelectBarViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/12.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "SelectBarViewController.h"
#import "YesterdayViewController.h"
#import "TodayViewController.h"
#import "TomorrowLViewController.h"
#import "SDSelectBarController.h"
#import "Masonry.h"
@interface SelectBarViewController ()

@end

@implementation SelectBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    YesterdayViewController *yesterdayVc = [[YesterdayViewController alloc]init];
    yesterdayVc.title = @"今天";
    
    TodayViewController *todayVc = [[TodayViewController alloc]init];
    todayVc.title = @"昨天";

    TomorrowLViewController *tomorrowVc = [[TomorrowLViewController alloc]init];
    tomorrowVc.title = @"明天";

    CGFloat selectBarHeight = 0.0f;
    
    if (@available(iOS 11.0, *)) {
        selectBarHeight = 88;
    } else {
        selectBarHeight = 64;
    }
    
    SDSelectBarController *selectBar = [[SDSelectBarController alloc]initWithTitlesFrame:CGRectMake(0, selectBarHeight, 375, 44)];
    selectBar.backgroundColor = [UIColor yellowColor];
    selectBar.titleNormalColor = [UIColor blackColor];
    selectBar.titleSelectColor = [UIColor redColor];
    selectBar.indicatorColor = [UIColor redColor];
    selectBar.indicatorHeight = 2;
    selectBar.viewControllers = @[yesterdayVc,todayVc];
    [self.view addSubview:selectBar];
    
    [selectBar mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(88);
        } else {
            make.top.mas_equalTo(64);
        }
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(64);
        make.width.mas_equalTo(375);
        
    }];

}



@end
