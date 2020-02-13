//
//  UIWindow+SPSafeArea.m
//  text
//
//  Created by 罗盼 on 2019/12/18.
//  Copyright © 2019 lp. All rights reserved.
//

#import "UIWindow+SPSafeArea.h"


@implementation UIWindow (SPSafeArea)

- (UIEdgeInsets)sp_layoutInsets {
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets safeAreaInsets = self.safeAreaInsets;
        if (safeAreaInsets.bottom > 0) {
            //参考文章：https://mp.weixin.qq.com/s/Ik2zBox3_w0jwfVuQUJAUw
            return safeAreaInsets;
        }
        return UIEdgeInsetsMake(20, 0, 0, 0);
    }
    return UIEdgeInsetsMake(20, 0, 0, 0);
}

- (CGFloat)sp_safeAreaNavigationHeight {
    return [self sp_layoutInsets].top;
}

- (CGFloat)sp_navigationHeight {
    return [self sp_safeAreaNavigationHeight] + 44;
}

- (CGFloat)sp_safeAreaTabbarHeight {
    return [self sp_layoutInsets].bottom;
}

- (CGFloat)sp_tabbarHeight {
    return [self sp_safeAreaTabbarHeight] + 49;
}

@end
