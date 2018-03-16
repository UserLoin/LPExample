//
//  UIImage+Addtion.m
//  LPExample
//
//  Created by 咖达 on 2017/8/16.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "UIImage+Addtion.h"

@implementation UIImage (Addtion)

#pragma mark - 方法一
- (instancetype)circleImageOne
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    //CGRect rect = CGRectMake(0, 0, 40, 40);

    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}
#pragma mark - 方法二
- (instancetype)circleImageTwo
{
    return nil;
}
#pragma mark - 方法三
- (instancetype)circleImageThree
{
    return nil;
}
#pragma mark - 方法四
- (instancetype)circleImageFour
{
    return nil;
}
@end
