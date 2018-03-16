//
//  NSObject+Caculator.m
//  02-链式编程思想(计算器)
//
//  Created by xiaomage on 15/9/29.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "NSObject+Caculator.h"

#import "CaculatorMaker.h"

@implementation NSObject (Caculator)
+ (CGFloat)makeCaculator:(void (^)(CaculatorMaker *))block
{
    // 创建计算制造者
    CaculatorMaker *maker = [[CaculatorMaker alloc] init];
    // 计算
    block(maker);
    
    return maker.result;
}
@end
