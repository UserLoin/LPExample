//
//  CaculatorMakerViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/9/3.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "CaculatorMakerViewController.h"
#import "CaculatorMaker.h"
#import "NSObject+Caculator.h"
@interface CaculatorMakerViewController ()

@end

@implementation CaculatorMakerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // block:使代码高聚合
    CGFloat result = [NSObject makeCaculator:^(CaculatorMaker *maker) {
        
        // 把所有的计算代码封装到这里
        maker.add(10).add(20);
        maker.add(30).add(40);
        maker.multy(3);
        maker.divide(10);
    }];
    
    NSLog(@"%.2f",result);
}

// 之前开发中比较习惯,把事情封装到一个方法中,
// 链式编程思想:把要做的事情封装到block,给外界提供一个返回这个Block的方法
// 链式编程思想方法特点:方法返回值必须是block,block参数:放需要操作的内容,block返回值:方法调用者

@end
