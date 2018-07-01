//
//  CTStopCar3ViewController.m
//  LPExample
//
//  Created by 罗盼 on 2018/7/1.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "CTStopCar3ViewController.h"
#import "PCBPasswordView.h"

@interface CTStopCar3ViewController ()

@end

@implementation CTStopCar3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    PCBPasswordView *passwordView = [[PCBPasswordView alloc]initWithFrame:CGRectMake(16, 150, [UIScreen mainScreen].bounds.size.width-32, 44)];
    [self.view addSubview:passwordView];
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
