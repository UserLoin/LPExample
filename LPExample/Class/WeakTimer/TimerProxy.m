//
//  TimerProxy.m
//  LPExample
//
//  Created by 罗盼 on 2020/8/27.
//  Copyright © 2020 咖达. All rights reserved.
//

#import "TimerProxy.h"
@interface TimerProxy ()
@property(nonatomic, weak) id target;
@end
@implementation TimerProxy
+ (instancetype)proxyWithTarget:(id)target {
    TimerProxy *proxy = [TimerProxy alloc]; //注意：没有init方法
    proxy.target = target;
    return proxy;
}

// NSProxy接收到消息会自动进入到调用这个方法 进入消息转发流程
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
@end
