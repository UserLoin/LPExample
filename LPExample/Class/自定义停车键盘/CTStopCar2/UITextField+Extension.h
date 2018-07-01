//
//  UITextField+Extension.h
//  XinQiuParking
//
//  Created by Simple_Code on 2018/6/26.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  监听删除按钮
 *  object:UITextField
 */
extern NSString * const YXTextFieldDidDeleteBackwardNotification;

@protocol YXTextFieldDelegate <UITextFieldDelegate>
@optional
- (void)textFieldDidDeleteBackward:(UITextField *)textField;
@end


@interface UITextField (Extension)
@property (weak, nonatomic) id<YXTextFieldDelegate> delegate;
- (void)xqp_resignFirstResponderWith:(NSInteger)length;
- (void)xqp_becomeFirstResponderWith:(UITextField *)textfield length:(NSInteger)length;
@end

