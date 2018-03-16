//
//  ImageViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/8/6.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImage+Addtion.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    //注意这是加载图片最简单的方式；这张图片会被缓存到缓存中，加载速度较快；
    UIImage *image = [UIImage imageNamed:@"地址定位框"];
    /*
    CGFloat top = 100; // 顶端盖高度
    CGFloat bottom = 100 ; // 底端盖高度
    CGFloat left = 30; // 左端盖宽度
    CGFloat right = 300; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
8    */
    
    [image dc_stretchLeftAndRightWithContainerSize:CGSizeMake(375, 173)];
    
    
    //图片的显示是需要载体的；需要放在UIImageView；
    UIImageView *imgView = [[UIImageView alloc]init];
    //图片显示在屏幕上的大小是由载体控制的；
    //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
    imgView.frame = CGRectMake(0,200,375, 200);
    imgView.backgroundColor = [UIColor yellowColor];
    [imgView setImage:image];
    
    [self.view addSubview:imgView];
    imgView.layer.masksToBounds = YES;
    
    
    //图片的显示模式；
    /*
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     
     */
    //内容模式；
    //注意：UIViewContentModeScaleToFill是默认的显示效果；
    /*
     UIViewContentModeScaleToFill:拉伸充满整个载体；
     UIViewContentModeScaleAspectFit：拉伸不改变比例，充满最小的一边；
     UIViewContentModeScaleAspectFill：拉伸不改变比例，充满最大的一边；
     */
    //imgView.contentMode =  UIViewContentModeScaleAspectFill;
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
