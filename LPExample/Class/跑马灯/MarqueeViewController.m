
//
//  MarqueeViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/19.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "MarqueeViewController.h"
#import "BBFlashCtntLabel.h"
@interface MarqueeViewController ()

@end

@implementation MarqueeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 5; i++) {
        CGRect rect = CGRectMake(20, 450 - i * 52, 180, 50);
        BBFlashCtntLabel *lbl = [[BBFlashCtntLabel alloc] initWithFrame:rect];
        lbl.backgroundColor = [UIColor lightGrayColor];
        lbl.leastInnerGap = 50.f;
        if (i % 3 == 0) {
            lbl.repeatCount = 5;
            lbl.speed = BBFlashCtntSpeedSlow;
        } else if (i % 3 == 1) {
            lbl.speed = BBFlashCtntSpeedMild;
        } else {
            lbl.speed = BBFlashCtntSpeedFast;
        }
        NSString *str = @"测试文字。来来；‘了哈哈😄^_^abcdefg123456👿";
        if (i %2 == 0) {
            lbl.text = str;
            lbl.font = [UIFont systemFontOfSize:25];
            lbl.textColor = [UIColor whiteColor];
        } else {
            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:str];
            [att addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:25]
                        range:NSMakeRange(0, 5)];
            [att addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:17]
                        range:NSMakeRange(15, 5)];
            [att addAttribute:NSBackgroundColorAttributeName
                        value:[UIColor cyanColor]
                        range:NSMakeRange(0, 15)];
            [att addAttribute:NSForegroundColorAttributeName
                        value:[UIColor redColor]
                        range:NSMakeRange(8, 7)];
            lbl.attributedText = att;
        }
        if (i == 0) {
            lbl.textColor = [UIColor greenColor];
            lbl.text = @"少量文字";
        }
        
        [self.view addSubview:lbl];
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
