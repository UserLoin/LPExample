//
//  CaculatorMaker.m
//  02-链式编程思想(计算器)
//
//  Created by xiaomage on 15/9/29.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "CaculatorMaker.h"


@implementation CaculatorMaker

- (CaculatorMaker * (^)(CGFloat num))add
{
    return ^(CGFloat num){
      
        _result += num;
        
        return self;
    };
}
- (CaculatorMaker *(^)(CGFloat))subtract
{
    return ^(CGFloat num){
        
        _result -= num;
        
        return self;
    };
}
- (CaculatorMaker *(^)(CGFloat))multy
{
    return ^(CGFloat num){
        
        _result *= num;
        
        return self;
    };
}
- (CaculatorMaker *(^)(CGFloat))divide
{
    return ^(CGFloat num){
        
        _result = _result/num;
        
        return self;
    };
}
@end
