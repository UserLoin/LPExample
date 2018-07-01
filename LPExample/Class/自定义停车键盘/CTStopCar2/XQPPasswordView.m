//
//  XQPPasswordView.m
//  XinQiuParking
//
//  Created by Simple_Code on 2018/6/20.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import "XQPPasswordView.h"
#import "UITextField+Extension.h"

#define kShowTextLabelSize CGSizeMake (30, 30) //showNumLbael的大小
#define K_Field_Height self.frame.size.height  //每一个输入框的高度等于当前view的高度

@interface XQPPasswordView ()<UITextFieldDelegate,YXTextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *showNumArray; //用于存放showNumLbael
@property (nonatomic, assign) NSInteger count; //用于存放showNumLbael
@property (nonatomic, strong) UITextField *tempTextField;


@end
@implementation XQPPasswordView

#pragma mark - 初始化
- (id)initWithFrame:(CGRect)frame countCode:(NSInteger)countCode
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.count = countCode;
        [self createUI];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        __weak typeof(self) weakself = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            if ([weakself isDisplayedInScreen]) {
                weakself.tempTextField.layer.borderWidth = 0;
            }
        }];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    for (int i = 0; i < self.count; i++) {
        
        UITextField *textfield = [[UITextField alloc]init];
        [self addSubview:textfield];
        textfield.frame = CGRectMake((self.frame.size.width/((CGFloat)self.count))*i + 2, 3, self.frame.size.width/((CGFloat)self.count) - 4, self.frame.size.height-6);
        textfield.layer.cornerRadius = 3;
        textfield.layer.masksToBounds = YES;
        textfield.layer.borderColor = [UIColor blueColor].CGColor;

        //输入框光标的颜色为白色
        textfield.tintColor = [UIColor redColor];
        textfield.textAlignment = NSTextAlignmentCenter;
        textfield.tag = 200 + i;
        textfield.delegate = self;
        textfield.textColor = [UIColor blackColor];
        textfield.font = [UIFont systemFontOfSize:16];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        [textfield addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
        [textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        label.backgroundColor = [UIColor grayColor];
        label.frame = CGRectMake((self.frame.size.width/((CGFloat)self.count))*(i + 1) - 0.5f, 9, 1, self.frame.size.height - 18);
    }
}
- (void)onClick:(UITextField *)textField  {
    
    self.tempTextField.layer.borderWidth = 0;
    self.tempTextField = textField;
    textField.layer.borderWidth = 1;
}

#pragma mark - 键盘输入
- (void)textFieldDidChange:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        textField.text = [textField.text substringFromIndex:textField.text.length - 1];
        UITextField *tempTextField;
        if (textField.tag - 200 < self.count - 1) {
            tempTextField = (UITextField *)[self viewWithTag:textField.tag + 1];
        }else{
            tempTextField = (UITextField *)[self viewWithTag:200 + self.count - 1];
        }
        [self onClick:tempTextField];
        [tempTextField becomeFirstResponder];
    }
    
}

#pragma mark - 键盘删除
- (void)textFieldDidDeleteBackward:(UITextField *)textField {
    NSLog(@"%@",textField.text);
    textField.text = nil;
    UITextField *tempTextField;
    if (textField.tag - 200 > 0) {
        tempTextField = (UITextField *)[self viewWithTag:textField.tag - 1];
    }else{
        tempTextField = (UITextField *)[self viewWithTag:200];
    }
    [self onClick:tempTextField];
    [tempTextField becomeFirstResponder];
}

#pragma mark - other
// 判断View是否显示在屏幕上---防止代码重复进行
- (BOOL)isDisplayedInScreen {
    if (self == nil) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [self convertRect:self.frame toView:win];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return NO;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return NO;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return NO;
    }

    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}
@end
