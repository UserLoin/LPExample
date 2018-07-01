//
//  CTStopCar2ViewController.m
//  LPExample
//
//  Created by 罗盼 on 2018/7/1.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "CTStopCar2ViewController.h"
#import "XQPPasswordView.h"

@interface CTStopCar2ViewController ()

@end

@implementation CTStopCar2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    XQPPasswordView *passwordView = [[XQPPasswordView alloc]initWithFrame:CGRectMake(16, 150, [UIScreen mainScreen].bounds.size.width - 2*16, 44) countCode:6];
    [self.view addSubview:passwordView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(16, 200, [UIScreen mainScreen].bounds.size.width - 2*16, 44)];
    label.text = @"设置UITextfield的光标为透明色可以隐藏光标";
    label.textColor = [UIColor redColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
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
