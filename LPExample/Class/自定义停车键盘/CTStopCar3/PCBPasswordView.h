//
//  PCBPasswordView.h
//  PaoChengB
//
//  Created by 罗盼 on 2017/12/7.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PCBPasswordViewBlock)(NSString *);
@interface PCBPasswordView : UIView<UITextFieldDelegate>
@property(nonatomic,copy)PCBPasswordViewBlock currentTextBlock;
/**
 *  清除密码
 */

- (void)clearUpPassword;
@end
