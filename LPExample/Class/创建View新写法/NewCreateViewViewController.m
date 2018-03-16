//
//  NewCreateViewViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/13.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "NewCreateViewViewController.h"

@interface NewCreateViewViewController ()

@end

@implementation NewCreateViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    subView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:subView];
    
    
    //纯代码对象创建的编写方式优化
    
    /*优点：
     1.使代码逻辑结构层次划分得更加明显
     2.对于一个无需复用的小段逻辑也免去了重量级的调用函数
     3.当你想要复制粘贴这段代码时，你仅需要更改一处变量名即可
     */
    
    UIView *subView1 = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        view;
    });
    subView1.backgroundColor = [UIColor yellowColor];
}

@end
