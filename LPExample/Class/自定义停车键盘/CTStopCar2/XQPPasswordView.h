//
//  XQPPasswordView.h
//  XinQiuParking
//
//  Created by Simple_Code on 2018/6/20.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^XQPPasswordViewBlock)(NSString *);
@interface XQPPasswordView : UIView<UITextFieldDelegate>
- (id)initWithFrame:(CGRect)frame countCode:(NSInteger)countCode;
@property(nonatomic,copy)XQPPasswordViewBlock currentTextBlock;
@end
