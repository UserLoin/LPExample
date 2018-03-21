
//
//  ReduceTimeViewController.m
//  LPExample
//
//  Created by 罗盼 on 2017/10/12.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "ReduceTimeViewController.h"
#import "CQCountDownButton.h"
#import <SVProgressHUD.h>
@interface ReduceTimeViewController ()
@property (nonatomic, strong) CQCountDownButton *countDownButton;
@end

@implementation ReduceTimeViewController

int a = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block int b = 2; int c = 3;

    void(^block)(void) = ^(void) {
        NSLog(@"%d,%d,%d",a,b,c);
    };
    
    a = 4; b = 5; c = 6;

    block();
    
    
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    // 对齐方式
    style.alignment = NSTextAlignmentJustified;
    
    // 首行缩进
    style.firstLineHeadIndent = 20.0f;
    
    // 头部缩进
    //style.headIndent = 10.0f;
    
    // 尾部缩进
    style.tailIndent = 0.0f;
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:@"后发酵沙发沙发没事你的VB每年保持是毛主席你吃吧是们专项储备是zmnxcvajdfbadasdvmnabsmnvabdvasvbasbnmdv发多少八九点" attributes:@{ NSParagraphStyleAttributeName : style}];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 150, 150)];
    label.numberOfLines = 0;
    label.attributedText = attrText;
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
    
    
    
    
    
    // 创建倒计时Button
    [self createReduceTimeButton];
}
// 创建倒计时Button
- (void)createReduceTimeButton{
    
    __weak __typeof__(self) weakSelf = self;
    self.countDownButton = [[CQCountDownButton alloc] initWithDuration:60 buttonClicked:^{
        //------- 按钮点击 -------//
        [SVProgressHUD showWithStatus:@"正在获取验证码..."];
        // 请求数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            int a = arc4random() % 2;
            if (a == 0) {
                // 获取成功
                [SVProgressHUD showSuccessWithStatus:@"验证码已发送"];
                // 获取到验证码后开始倒计时
                [weakSelf.countDownButton startCountDown];
            } else {
                // 获取失败
                [SVProgressHUD showErrorWithStatus:@"获取失败，请重试"];
                weakSelf.countDownButton.enabled = YES;
            }
        });
    } countDownStart:^{
        //------- 倒计时开始 -------//
        NSLog(@"倒计时开始");
    } countDownUnderway:^(NSInteger restCountDownNum) {
        //------- 倒计时进行中 -------//
        [weakSelf.countDownButton setTitle:[NSString stringWithFormat:@"再次获取(%ld秒)", restCountDownNum] forState:UIControlStateNormal];
    } countDownCompletion:^{
        //------- 倒计时结束 -------//
        [weakSelf.countDownButton setTitle:@"点击获取验证码" forState:UIControlStateNormal];
        NSLog(@"倒计时结束");
    }];
    
    [self.view addSubview:self.countDownButton];
    self.countDownButton.backgroundColor = [UIColor yellowColor];
    self.countDownButton.frame = CGRectMake(90, 90, 200, 30);
    [self.countDownButton setTitle:@"点击获取验证码数据" forState:UIControlStateNormal];
    [self.countDownButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.countDownButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

}

@end
