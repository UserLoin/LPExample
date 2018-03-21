//
//  YYTipLabel.h
//  Avene
//
//  Created by 123456789 on 2018/3/19.
//  Copyright © 2018年 WangYiTec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYTipLabel : UILabel
@end

@interface UIView (YYTip)
- (void)showTip:(NSString *)tip;
- (void)hiddenTip;
@end
