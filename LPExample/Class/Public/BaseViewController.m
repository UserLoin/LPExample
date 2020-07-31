
//
//  BaseViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/14.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc {
    NSLog(@"✅%@被销毁了✅",self);
}
@end
