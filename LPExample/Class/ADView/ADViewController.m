//
//  ADViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/6/11.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "ADViewController.h"
#import "ADView.h"

@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.view.clipsToBounds = YES;
    
    //ADView *adView = [[ADView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150) andImageNameArray:[NSMutableArray arrayWithArray:@[@"11.jpg",@"22.jpg",@"33.jpg"]] andIsRunning:YES];
    ADView *adView = [[ADView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150)
                             andDistanceForScroll:12
                                           andGap:8
                                andImageNameArray:[NSMutableArray arrayWithArray:@[@"11.jpg",@"22.jpg",@"33.jpg"]]
                                     andIsRunning:YES
                                         andBlock:^(NSString *name) {
        
    }];
    [self.view addSubview:adView];
    
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
