//
//  TimerViewController.m
//  Test
//
//  Created by 罗盼 on 2020/7/27.
//  Copyright © 2020 sp. All rights reserved.
//

#import "TimerViewController.h"
#import "NSTimer+WeakTimer.h"
#import "TimerProxy.h"

@interface TimerViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation TimerViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLoad{

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"OrangeColor";
    self.
    /**
     1.__weak typeof(self) weakSelf = self; 不能解决

     */
    
    //开启定时器
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(testTimerDeallo) userInfo:nil repeats:YES];
    //self.timer = [NSTimer scheduledWeakTimerWithTimeInterval:2.0 target:self selector:@selector(testTimerDeallo) userInfo:self.timer.userInfo repeats:YES];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:[TimerProxy proxyWithTarget:self] selector:@selector(testTimerDeallo) userInfo:self.timer.userInfo repeats:YES];
}

/** 方法一直执行 */
-(void)testTimerDeallo{
    NSLog(@"-----");
}

/** 开启定时器以后控制器不能被销毁,此方法不会被调用 */
-(void)dealloc{

    NSLog(@"销毁");
}

@end
