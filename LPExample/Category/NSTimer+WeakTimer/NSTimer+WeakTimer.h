//
//  NSTimer+WeakTimer.h
//  Test
//
//  Created by 罗盼 on 2020/7/27.
//  Copyright © 2020 sp. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (WeakTimer)
/**
 1.重写开启定时器方法,在内部对target进行替换,换成本类(TimerWeakTarget)的对象即可
 2.不会造成循环引用了,原控制器OneViewController属性有timer对timer强应用,timer内部对self强引用,但是self在此方法内部被替换成了本类的对象(TimerWeakTarget *),而本类的对象不会对OneViewController强引用,则不会造成循环引用,也就不会造成内存泄露
 */
+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
