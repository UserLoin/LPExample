//
//  NSObject+Caculator.h
//  02-链式编程思想(计算器)
//
//  Created by xiaomage on 15/9/29.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CaculatorMaker.h"

@interface NSObject (Caculator)

// 以后计算都使用这个方法,一调用这个方法就返回结果.
+ (CGFloat)makeCaculator:(void(^)(CaculatorMaker *))block;

@end
