//
//  LPKVONotifying_Person.m
//  LPExample
//
//  Created by 咖达 on 2017/9/3.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "LPKVONotifying_Person.h"
#import <objc/runtime.h>

@implementation LPKVONotifying_Person

- (void)setAge:(int)age
{
    [super setAge:age];
    
    // 通知观察者,属性改变
    id observer = objc_getAssociatedObject(self, @"observer");
    
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
}

@end
