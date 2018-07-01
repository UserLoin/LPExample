//
//  UITextField+Extension.m
//  XinQiuParking
//
//  Created by Simple_Code on 2018/6/26.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import "UITextField+Extension.h"
#import <objc/runtime.h>
NSString * const YXTextFieldDidDeleteBackwardNotification = @"textfield_did_notification";

@implementation UITextField (Extension)
+ (void)load {
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
    Method method2 = class_getInstanceMethod([self class], @selector(yx_deleteBackward));
    method_exchangeImplementations(method1, method2);
}

- (void)yx_deleteBackward {
    [self yx_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)])
    {
        id <YXTextFieldDelegate> delegate  = (id<YXTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YXTextFieldDidDeleteBackwardNotification object:self];
}
- (void)xqp_resignFirstResponderWith:(NSInteger)length {
    if (self.text.length >= length) {
        self.text = [self.text substringToIndex:length];
        [self resignFirstResponder];
    }
}
- (void)xqp_becomeFirstResponderWith:(UITextField *)textfield length:(NSInteger)length {
    if (self.text.length >= length) {
        self.text = [self.text substringToIndex:length];
        [textfield becomeFirstResponder];
    }
}
@end
