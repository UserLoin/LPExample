//
//  CTKeybordView.h
//  KeybordView
//
//  Created by Simple_Code on 2018/6/25.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CTKeybordViewType) {
    CTKeybordViewSheng = 0,
    CTKeybordViewLetter
};
typedef void (^CTKeybordViewBlock)(NSString*);

@interface CTKeybordView : UIView
@property(nonatomic, copy) CTKeybordViewBlock btnClickBlock;
@property(nonatomic, copy) CTKeybordViewBlock deleteKeybordBlock;
@property(nonatomic, copy) CTKeybordViewBlock onClickConfirmBlock;

// 显示键盘
- (void)showInView:(UIView *)view;
- (void)dismiss;
@property(nonatomic, assign) CTKeybordViewType type;
@end
