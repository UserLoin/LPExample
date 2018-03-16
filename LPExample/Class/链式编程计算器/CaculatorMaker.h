//
//  CaculatorMaker.h
//  02-链式编程思想(计算器)
//
//  Created by xiaomage on 15/9/29.
//  Copyright © 2015年 小码哥. All rights reserved.
//  计算器

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CaculatorMaker : NSObject
@property (nonatomic, assign) int result;

// +
- (CaculatorMaker *(^)(CGFloat num))add;
// -
- (CaculatorMaker *(^)(CGFloat num))subtract;
// *
- (CaculatorMaker *(^)(CGFloat num))multy;
// ÷
- (CaculatorMaker *(^)(CGFloat num))divide;

@end
