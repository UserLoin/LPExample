//
//  CTInputView.m
//  KeybordView
//
//  Created by Simple_Code on 2018/6/25.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import "CTInputView.h"
@interface CTInputView ()
@property(nonatomic, assign) NSInteger count;
@property(nonatomic, strong) UIButton *tempButton;
@end
@implementation CTInputView

- (instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1;
        
        self.count = count;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    for (int i = 0; i < self.count; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        [self addSubview:button];
        button.frame = CGRectMake((self.frame.size.width/((CGFloat)self.count))*i + 2, 3, self.frame.size.width/((CGFloat)self.count) - 4, self.frame.size.height-6);
        button.layer.cornerRadius = 3;
        button.layer.masksToBounds = YES;
        button.layer.borderColor = [UIColor blueColor].CGColor;
        button.tag = 200 + i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        label.backgroundColor = [UIColor darkGrayColor];
        label.frame = CGRectMake((self.frame.size.width/((CGFloat)self.count))*(i + 1) - 0.5f, 8, 1, self.frame.size.height - 16);
    }
}

- (void)onClick:(UIButton *)btn {
    
    self.tempButton.layer.borderWidth = 0;
    self.tempButton = btn;
    btn.layer.borderWidth = 1;
    
    if (self.btnClickBlock) {
        self.btnClickBlock(btn.tag - 200);
    }
}

- (void)clickKeybordText:(NSString *)currentText tag:(NSInteger)tag {
    UIButton *tempBtn = (UIButton *)[self viewWithTag:200 + tag];
    [tempBtn setTitle:currentText forState:UIControlStateNormal];
    if (tag < self.count - 1) {
        [self onClick:(UIButton *)[self viewWithTag:200 + tag + 1]];
    }else{
        [self onClick:(UIButton *)[self viewWithTag:200 + self.count - 1]];
    }
}
- (void)deleteKeybordWithTag:(NSInteger)tag {
    UIButton *tempBtn = (UIButton *)[self viewWithTag:200 + tag];
    [tempBtn setTitle:@"" forState:UIControlStateNormal];
    if (tag > 0) {
        [self onClick:(UIButton *)[self viewWithTag:200 + tag - 1]];
    }else{
        [self onClick:(UIButton *)[self viewWithTag:200]];
    }
}
- (void)clearTempButtonLayer {
    self.tempButton.layer.borderWidth = 0;
}
@end
