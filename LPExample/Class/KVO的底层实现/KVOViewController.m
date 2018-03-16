//
//  KVOViewController.m
//  LPExample
//
//  Created by 咖达 on 2017/9/3.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "KVOViewController.h"
#import "Person.h"
#import "LPKVONotifying_Person.h"
@interface KVOViewController ()
@property (nonatomic, strong) Person *p;
@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // KVO
    //[self NSKVO];
    
    // 仿写KVO
    [self LPKVO];
}
- (void)NSKVO
{
    Person *person = [[Person alloc]init];
    _p = person;
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)LPKVO
{
    Person *person = [[Person alloc]init];
    _p = person;
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    // 只要p的age属性一改变,就会调用观察者的observeValueForKeyPath
    
    // KVO底层实现:
    // 1.动态创建NSKVONotifying_Person,NSKVONotifying_Person是Person子类,做KVO
    // 2.修改当前对象的isa指针->NSKVONotifying_Person
    // 3.只要调用对象的set,就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法,1.[super set:] 2.通知观察者,告诉你属性改变
    
    // 就是去判断有没有调用一个对象的set方法

}
// 监听的属性只要一改变就调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%d",_p.age);

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _p.age++;
    //    _p->_age ++;
}
@end
