//
//  NSObject+KVO.m
//  LPExample
//
//  Created by 咖达 on 2017/9/3.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "LPKVONotifying_Person.h"

@implementation NSObject (KVO)
- (void)lp_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    // 1.动态创建NSKVONotifying_Person,NSKVONotifying_Person是Person子类,做KVO
    // 2.修改当前对象的isa指针->NSKVONotifying_Person
    // 3.只要调用对象的set,就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法,1.[super set:] 2.通知观察者,告诉你属性改变
    
    // 修改isa,本质就是改变当前对象的类名
    object_setClass(self, [LPKVONotifying_Person class]);
    // 把观察者保存到当前对象里
    
    // 添加关联
    // id object:给哪个对象添加关联属性
    // key:属性名
    // value:关联值
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
@end
