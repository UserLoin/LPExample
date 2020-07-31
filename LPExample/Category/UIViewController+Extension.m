//
//  UIViewController+Extension.m
//  LPExample
//
//  Created by 罗盼 on 2017/11/27.
//  Copyright © 2017年 咖达. All rights reserved.
//

/**
 UIViewController 添加NSString属性的分类
 */

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

@implementation UIViewController (Extension)

#pragma mark - swizzle
+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method1, method2);
}

- (void)deallocSwizzle
{
    //NSLog(@"%@被销毁了", self);
    
    [self deallocSwizzle];
}

static char MethodKey;

- (void)setMethod:(NSString *)method
{
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)method
{
    return objc_getAssociatedObject(self, &MethodKey);
}

@end
