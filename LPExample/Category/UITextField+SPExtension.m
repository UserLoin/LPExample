//
//  UITextField+SPExtension.m
//  LPExample
//
//  Created by Simple_Code on 2018/6/27.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "UITextField+SPExtension.h"
#import <objc/runtime.h>

NSString * const SPTextFieldDidDeleteBackwardNotification = @"textfield_did_notification";

@implementation UITextField (SPExtension)

+ (void)load {
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
    Method method2 = class_getInstanceMethod([self class], @selector(sp_deleteBackward));
    method_exchangeImplementations(method1, method2);
}
- (void)sp_deleteBackward {
    [self sp_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)])
    {
        id <SPTextFieldDelegate> delegate  = (id<SPTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SPTextFieldDidDeleteBackwardNotification object:self];
}
@end
