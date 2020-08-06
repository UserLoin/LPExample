//
//  NSObject+SpExchange.m
//  Test
//
//  Created by 罗盼 on 2020/8/5.
//  Copyright © 2020 sp. All rights reserved.
//

#import "NSObject+SPExchange.h"
#import <objc/runtime.h>

@implementation NSObject (SPExchange)

/**
 方法交换
 @param origSel 原方法名
 @param newSel 新方法名
 */
+ (void)sp_methodSwizzleWithOrigSel:(SEL)origSel newSel:(SEL)newSel {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], origSel);
        Method swizzlingMethod = class_getInstanceMethod([self class], newSel);
        //添加不存在的方法,返回Yes;
        BOOL isAdded = class_addMethod([self class],
                                       method_getName(originalMethod),
                                       method_getImplementation(originalMethod),
                                       method_getTypeEncoding(originalMethod));
        if (isAdded) {
            NSLog(@"方法在原类中不存在，已经添加成功，用下面的方法替换其实现");
            class_replaceMethod([self class],
                                method_getName(originalMethod),
                                method_getImplementation(swizzlingMethod),
                                method_getTypeEncoding(swizzlingMethod));
        } else {
            NSLog(@"方法在原类中存在，用下面的方法交换其实现方法");
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
    });
}

@end
