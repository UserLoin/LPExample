//
//  SPUncaughtExceptionHandler.h
//  AvoidCrashDemo
//
//  Created by Simple_Code on 2018/9/4.
//  Copyright © 2018年 chenfanfang. All rights reserved.
//

#import <Foundation/Foundation.h>
#define UncaughtExceptionManager [SPUncaughtExceptionHandler shareInstance]
@interface SPUncaughtExceptionHandler : NSObject
+ (instancetype)shareInstance;

- (void)setDefaultHandler;
- (void)collectionExceptionMessage;
- (NSUncaughtExceptionHandler *)getHandler;
- (void)takeException:(NSException *) exception;

@end
