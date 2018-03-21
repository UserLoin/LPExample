//
//  YYTipLabel.m
//  Avene
//
//  Created by 123456789 on 2018/3/19.
//  Copyright © 2018年 WangYiTec. All rights reserved.
//

#import "YYTipLabel.h"
#import <objc/runtime.h>

@implementation YYTipLabel
@end


#pragma mark - 动态的给UIView添加属性
static char TipLabelKey;
@implementation UIView (YYTip)
- (void)setTipLabel:(YYTipLabel *)tipLabel {
    objc_setAssociatedObject(self, &TipLabelKey,
                             tipLabel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YYTipLabel *)tipLabel {
    return objc_getAssociatedObject(self, &TipLabelKey);
}
- (void)showTip:(NSString *)tip {
    if (!self.tipLabel) {
        self.tipLabel = [[YYTipLabel alloc]init];
        [self addSubview:self.tipLabel];
        self.tipLabel.text = tip;
        self.tipLabel.frame = CGRectMake(0, -20, 150, 20);
        self.tipLabel.hidden = NO;
        [self.tipLabel setFont:[UIFont systemFontOfSize:10]];
        self.tipLabel.numberOfLines = 0;
        self.tipLabel.textColor = [UIColor redColor];
        self.tipLabel.backgroundColor = [UIColor yellowColor];
        self.tipLabel.textAlignment = NSTextAlignmentLeft;
    }
}
- (void)hiddenTip {
    if (self.tipLabel) {
        self.tipLabel.hidden = YES;
        [self.tipLabel removeFromSuperview];
        self.tipLabel = nil;
    }
}
@end
