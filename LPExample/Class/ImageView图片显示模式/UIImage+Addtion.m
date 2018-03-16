//
//  UIImage+Addtion.m
//  
//
//  Created by 咖达 on 2017/8/14.
//
//

#import "UIImage+Addtion.h"

@implementation UIImage (Addtion)
- (UIImage *)dc_stretchLeftAndRightWithContainerSize:(CGSize)size
{
    CGSize imageSize = self.size;
    CGSize bgSize = size;
    
    //1.第一次拉伸右边 保护左边
    UIImage *image = [self stretchableImageWithLeftCapWidth:imageSize.width *0.8 topCapHeight:imageSize.height * 0.5];
    
    //第一次拉伸的距离之后图片总宽度
    CGFloat tempWidth = (bgSize.width)/2 + imageSize.width/2;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, imageSize.height), NO, [UIScreen mainScreen].scale);
    
    [image drawInRect:CGRectMake(0, 0, tempWidth, bgSize.height)];
    
    //拿到拉伸过的图片
    UIImage *firstStrechImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //2.第二次拉伸左边 保护右边
    UIImage *secondStrechImage = [firstStrechImage stretchableImageWithLeftCapWidth:firstStrechImage.size.width *0.1 topCapHeight:firstStrechImage.size.height*0.5];
    
    return secondStrechImage;
}

@end
