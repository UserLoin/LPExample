//
//  CTStopCarExampleViewController.m
//  LPExample
//
//  Created by 罗盼 on 2018/6/30.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "CTStopCarExampleViewController.h"
#import "CTStopCar1ViewController.h"
#import "CTStopCar2ViewController.h"
#import "CTStopCar3ViewController.h"

@interface CTStopCarExampleViewController ()

@end

@implementation CTStopCarExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSArray *array = @[@"1",@"2",@"3"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [[UIButton alloc]init];
        [self.view addSubview:button];
        button.tag = idx;
        button.frame = CGRectMake(100, 200 + (30+50)*idx, [UIScreen mainScreen].bounds.size.width - 2*100, 30);
        button.backgroundColor = [UIColor redColor];
        [button setTitle:array[idx] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}
- (void)onClick:(UIButton *)btn {
    if (btn.tag == 0) {
        CTStopCar1ViewController *vc1 = [[CTStopCar1ViewController alloc]init];
        [self.navigationController pushViewController:vc1 animated:YES];
    } else if(btn.tag == 1) {
        CTStopCar2ViewController *vc2 = [[CTStopCar2ViewController alloc]init];
        [self.navigationController pushViewController:vc2 animated:YES];
    } else {
        CTStopCar3ViewController *vc3 = [[CTStopCar3ViewController alloc]init];
        [self.navigationController pushViewController:vc3 animated:YES];
    }
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
