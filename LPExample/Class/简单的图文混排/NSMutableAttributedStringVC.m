//
//  NSMutableAttributedStringVC.m
//  LPExample
//
//  Created by 咖达 on 2017/8/2.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "NSMutableAttributedStringVC.h"

@interface NSMutableAttributedStringVC ()

@end

@implementation NSMutableAttributedStringVC
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self label1];
    [self label2];
    [self label3];
}

- (void)label1{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    label1.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:label1];
    
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] initWithString:@"我爱你中国"];
    [strM addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [strM addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 3)];
    label1.attributedText = strM;
}

- (void)label2{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    label1.center = CGPointMake(self.view.frame.size.width/2, 200);
    [self.view addSubview:label1];
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"small.jpg"];
    // 修改附件的尺寸
    attachment.bounds = CGRectMake(0, -4, 20, 20);
    NSAttributedString *imageText = [NSAttributedString attributedStringWithAttachment:attachment];
    label1.attributedText = imageText;
}

- (void)label3{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    label1.center = CGPointMake(self.view.frame.size.width/2, 300);
    [self.view addSubview:label1];
    
    label1.font = [UIFont systemFontOfSize:20];
    
    NSMutableAttributedString *strM = [[NSMutableAttributedString alloc] init];
    
    // 1.文字
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"我"];
    
    // 2.图片
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"small.jpg"];
    // 修改附件的尺寸
    attachment.bounds = CGRectMake(0, -4, 20, 20);
    NSAttributedString *imageText = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 3.文字
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"LOVE YOU"];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 3)];
    
    // 4.拼接
    [strM appendAttributedString:str1];
    [strM appendAttributedString:imageText];
    [strM appendAttributedString:str2];
    
    label1.attributedText = strM;
}
@end
