//
//  UIViewController+Extension.h
//  LPExample
//
//  Created by 罗盼 on 2017/11/27.
//  Copyright © 2017年 咖达. All rights reserved.
//

/**
 UIViewController 添加NSString属性的分类
 */

#import <UIKit/UIKit.h>

/*
 检测每一个ViewController的dealloc
 防止循环引用
 */

@interface UIViewController (Extension)
@property (copy, nonatomic) NSString *method;
@end
