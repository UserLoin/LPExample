//
//  TimerProxy.h
//  LPExample
//
//  Created by 罗盼 on 2020/8/27.
//  Copyright © 2020 咖达. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy
+ (instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
