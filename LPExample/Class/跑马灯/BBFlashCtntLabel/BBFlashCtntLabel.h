//
//  BBFlashCtntLabel.h
//  DebugTest
//
//  Created by iXcoder on 15/3/2.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BBFlashCtntSpeed) {
    BBFlashCtntSpeedSlow = -1,
    BBFlashCtntSpeedMild,
    BBFlashCtntSpeedFast
};

@interface BBFlashCtntLabel : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;         // 默认:system(15)
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) NSAttributedString *attributedText;

@property (nonatomic, assign) BBFlashCtntSpeed speed;

// 循环滚动次数(为0时无限滚动)
@property (nonatomic, assign) NSUInteger repeatCount;

@property (nonatomic, assign) CGFloat leastInnerGap;

- (void)reloadView;

@end
