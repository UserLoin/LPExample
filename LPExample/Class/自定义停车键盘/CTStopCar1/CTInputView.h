//
//  CTInputView.h
//  KeybordView
//
//  Created by Simple_Code on 2018/6/25.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CTInputViewBlock)(NSInteger);
@interface CTInputView : UIView

/**
 初始化CTInputView
 @param count 输入框的个数
 */
- (instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count;
- (void)clickKeybordText:(NSString *)currentText tag:(NSInteger)tag;
- (void)deleteKeybordWithTag:(NSInteger)tag;
- (void)clearTempButtonLayer;
@property(nonatomic, copy) CTInputViewBlock btnClickBlock;
@property(nonatomic, strong) UIButton *button;
@end
