//
//  UIWindow+JXSafeArea.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/9/29.
//  Copyright © 2018 jiaxin. All rights reserved.
//

#import "UIWindow+JXSafeArea.h"

@implementation UIWindow (JXSafeArea)

- (UIEdgeInsets)jx_layoutInsets {
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

- (CGFloat)jx_safeAreaNavigationHeight {
    return [self jx_layoutInsets].top;
}

- (CGFloat)jx_navigationHeight {
    return [self jx_safeAreaNavigationHeight] + 44;
}

- (CGFloat)jx_safeAreaTabbarHeight {
    return [self jx_layoutInsets].bottom;
}

- (CGFloat)jx_tabbarHeight {
    return [self jx_safeAreaTabbarHeight] + 49;
}

@end
