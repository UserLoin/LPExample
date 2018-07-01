//
//  PCBPasswordView.m
//  PaoChengB
//
//  Created by 罗盼 on 2017/12/7.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "PCBPasswordView.h"

#define kShowTextLabelSize CGSizeMake (30, 30) //showNumLbael的大小
#define kShowTextLabelCount 8  //密码个数
#define K_Field_Height self.frame.size.height  //每一个输入框的高度等于当前view的高度

@interface PCBPasswordView ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *showNumArray; //用于存放showNumLbael

@end
@implementation PCBPasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        [self initPwdTextField];
    }
    return self;
}

- (void)initPwdTextField
{
    // 每个密码输入框的宽度
    CGFloat width = self.frame.size.width / kShowTextLabelCount;
    
    // 生成分割线
    for (int i = 0; i < kShowTextLabelCount - 1; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + (i + 1) * width, 5, 1, K_Field_Height - 10)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
    }
    
    // 存储显示文字的label
    self.showNumArray = [[NSMutableArray alloc] init];
    
    // 生成显示的文字
    for (int i = 0; i < kShowTextLabelCount; i++) {
        UILabel *showNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + (width - kShowTextLabelSize.width) / 2 + i * width, CGRectGetMinY(self.textField.frame) + (K_Field_Height - kShowTextLabelSize.height) / 2, kShowTextLabelSize.width, kShowTextLabelSize.height)];
        showNumLabel.layer.cornerRadius = kShowTextLabelSize.width / 2.0f;
        showNumLabel.clipsToBounds = YES;
        showNumLabel.hidden = YES; //先隐藏
        showNumLabel.textAlignment = NSTextAlignmentCenter;
        showNumLabel.font = [UIFont systemFontOfSize:30];
        showNumLabel.textColor = [UIColor blackColor];
        [self addSubview:showNumLabel];
        
        // 把创建的显示的文字的label加入到数组中
        [self.showNumArray addObject:showNumLabel];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"变化%@", string);
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if(string.length == 0) {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= kShowTextLabelCount) {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        NSLog(@"输入的字符个数大于8，忽略输入");
        return NO;
    } else {
        return YES;
    }
}

/**
 *  清除密码
 */
- (void)clearUpPassword
{
    self.textField.text = @"";
    [self textFieldDidChange:self.textField];
}

/**
 *  重置显示的点
 */
- (void)textFieldDidChange:(UITextField *)textField
{
    if (self.currentTextBlock) {
        self.currentTextBlock(textField.text);
    }
    NSLog(@"%@", textField.text);
    for (UIView *showNumLabel in self.showNumArray) {
        showNumLabel.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        UILabel *label = (UILabel *)[self.showNumArray objectAtIndex:i];
        label.hidden = NO;
        label.text = [textField.text substringWithRange:NSMakeRange(i, 1)];
    }
    if (textField.text.length == kShowTextLabelCount) {
        NSLog(@"输入完毕");
        [self endEditing:YES];
    }
}

#pragma mark - init

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, K_Field_Height)];
        _textField.backgroundColor = [UIColor clearColor];
        //输入的文字颜色为白色
        _textField.textColor = [UIColor clearColor];
        //输入框光标的颜色为白色
        _textField.tintColor = [UIColor clearColor];
        _textField.delegate = self;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.layer.borderColor = [[UIColor whiteColor] CGColor];
        _textField.layer.borderWidth = 1;
        _textField.layer.cornerRadius = 3;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_textField];
    }
    return _textField;
}

@end
