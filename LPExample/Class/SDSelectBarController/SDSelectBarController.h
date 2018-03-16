//
//  SDSelectBarController.h
//  SDSelectBarController
//
//  Created by 孙号斌 on 2017/1/17.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol SDSelectBarControllerProtocol <NSObject>

- (BOOL)barControlWillClickItemWithIndex:(NSInteger)index;

@end
@interface SDSelectBarController : UIControl
- (instancetype)initWithTitlesFrame:(CGRect)frame;

/**
 *  控制器数组
 */
@property (strong, nonatomic) NSArray * viewControllers;

/**
 *  标题正常字体颜色
 */
@property (strong, nonatomic) UIColor * titleNormalColor;

/**
 *  标题选中字体颜色
 */
@property (strong, nonatomic) UIColor * titleSelectColor;

/**
 *  是否显示指示器
 */
@property (assign, nonatomic) BOOL haveIndicator;
/**
   指示器高度
 */
 @property (nonatomic,assign) CGFloat  indicatorHeight;

/**
 *  文字的字体
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 *  设置指示器颜色(和底部栏图片只能设置一个)
 */
@property (nonatomic, strong) UIColor *indicatorColor;


@property (nonatomic, assign) NSInteger selectedIndex;


@property (nonatomic, assign) id<SDSelectBarControllerProtocol> myDelegate;



- (void)showViewControllerWithIndex:(NSInteger)index;

@end
