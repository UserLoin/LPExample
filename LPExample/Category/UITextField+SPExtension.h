//
//  UITextField+SPExtension.h
//  LPExample
//
//  Created by Simple_Code on 2018/6/27.
//  Copyright © 2018年 咖达. All rights reserved.
//

/*利用Runtime监听键盘删除按钮的事件*/

/*
在使用的文件中遵循YXTextFieldDelegate代理，代理的方法即为点击删除按钮事件：
- (void)textFieldDidDeleteBackward:(UITextField *)textField {
    //删除事件
}
*/

#import <UIKit/UIKit.h>

@protocol SPTextFieldDelegate <UITextFieldDelegate>
@optional
- (void)textFieldDidDeleteBackward:(UITextField *)textField;
@end

@interface UITextField (SPExtension)
@property (weak, nonatomic) id<SPTextFieldDelegate> delegate;
@end
/**
 *  监听删除按钮
 *  object:UITextField
 */
extern NSString * const SPTextFieldDidDeleteBackwardNotification;
