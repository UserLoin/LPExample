//
//  UIWindow+SPSafeArea.h
//  text
//
//  Created by 罗盼 on 2019/12/18.
//  Copyright © 2019 lp. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (SPSafeArea)
- (UIEdgeInsets)sp_layoutInsets;

/// 安全区域NavigationHeight（只有StatusBarHeight）
- (CGFloat)sp_safeAreaNavigationHeight;
/// navigationHeight
- (CGFloat)sp_navigationHeight;
/// 安全区域tabbarHeight (只有安全区域高度)
- (CGFloat)sp_safeAreaTabbarHeight;
/// tabbarHeight
- (CGFloat)sp_tabbarHeight;

@end

NS_ASSUME_NONNULL_END
