//
//  NSTimer+WeakTimer.m
//  Test
//
//  Created by 罗盼 on 2020/7/27.
//  Copyright © 2020 sp. All rights reserved.
//

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#import "NSTimer+WeakTimer.h"

@interface TimerWeakTarget : NSObject
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak) id target;
- (void)fire:(NSTimer *)timer;
@end

@implementation TimerWeakTarget

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            SuppressPerformSelectorLeakWarning([self.target performSelector:self.selector withObject:timer.userInfo]);
        }
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation NSTimer (WeakTimer)
+ (NSTimer *) scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval
                                          target:(id)aTarget
                                        selector:(SEL)aSelector
                                        userInfo:(id)userInfo
                                         repeats:(BOOL)repeats{

    TimerWeakTarget *object = [TimerWeakTarget new];
    object.target = aTarget;
    object.selector = aSelector;
    //此处的target已经被换掉了不是原来的ViewController而是TimerWeakTarget类的对象target
    object.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:object selector:@selector(fire:) userInfo:userInfo repeats:repeats];
    return object.timer;
}
@end
