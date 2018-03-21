//
//  SPTipTestViewController.m
//  LPExample
//
//  Created by 123456789 on 2018/3/21.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "SPTipTestViewController.h"
#import "YYTipLabel.h"

@interface SPTipTestViewController ()

@end

@implementation SPTipTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 150, 50)];
    label.text = @"我是label";
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    [label showTip:@"我是一个label"];
    
    //[label hiddenTip];//隐藏Tip
    
    UITextField *textField = [[UITextField alloc]init];
    [self.view addSubview:textField];
    textField.text = @"我是textField";
    textField.frame = CGRectMake(10, 200, 150, 50);
    textField.backgroundColor = [UIColor redColor];
    textField.textColor = [UIColor whiteColor];
    [textField showTip:@"我是textField"];

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
