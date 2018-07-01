//
//  CTKeybordView.m
//  KeybordView
//
//  Created by Simple_Code on 2018/6/25.
//  Copyright © 2018年 芯球科技. All rights reserved.
//

#import "CTKeybordView.h"
#define CTWIDTH  [UIScreen mainScreen].bounds.size.width
#define CTHEIGHT [UIScreen mainScreen].bounds.size.height
#define CTKEYBORDHEIGHT 230.f

@interface CTKeybordView ()
@property(nonatomic, strong) UIView *topBgView;
@property(nonatomic, strong) UIView *topLineView;
@property(nonatomic, strong) UIButton *confirmButton;
@property(nonatomic, strong) UIButton *deleteButton;
@end
@implementation CTKeybordView

#pragma mark - 显示键盘
- (void)showInView:(UIView *)view {
    
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [view addSubview:self];
    [self setFrame:CGRectMake(0, CTHEIGHT, CTWIDTH, CTKEYBORDHEIGHT)];
    
    [UIView animateWithDuration:0.3f animations:^{
        [self setFrame:CGRectMake(0, CTHEIGHT - CTKEYBORDHEIGHT, CTWIDTH, CTKEYBORDHEIGHT)];
    } completion:nil];
}

#pragma mark - 隐藏键盘
- (void)dismiss {
    
    [UIView animateWithDuration:0.3f animations:^{
        [self setFrame:CGRectMake(0, CTHEIGHT, CTWIDTH, CTKEYBORDHEIGHT)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - 懒加载
- (UIView *)topBgView {
    if (!_topBgView) {
        _topBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CTWIDTH, 30)];
        _topBgView.backgroundColor = [UIColor yellowColor];
    }
    return _topBgView;
}
- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CTWIDTH, 0.5)];
        _topLineView.backgroundColor = [UIColor grayColor];
    }
    return _topLineView;
}
- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [[UIButton alloc]initWithFrame:CGRectMake(CTWIDTH - 60, 0, 60, 30)];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(onClickDismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}
- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _deleteButton.backgroundColor = [UIColor redColor];
        _deleteButton.layer.cornerRadius = 3;
        [_deleteButton addTarget:self action:@selector(deleteKeybordText:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}
- (void)deleteKeybordText:(UIButton *)btn {
    if (self.deleteKeybordBlock) {
        self.deleteKeybordBlock(btn.currentTitle);
    }
}
- (void)onClickDismiss:(UIButton *)btn {
    if (self.onClickConfirmBlock) {
        self.onClickConfirmBlock(btn.currentTitle);
    }
    [self dismiss];
}
#pragma mark - 页面初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - setter方法
- (void)setType:(CTKeybordViewType)type {
    _type = type;
    _type ? [self createLetterView] : [self createShengView];
}

- (void)createLetterView {
    [self removeAllSubviews];
    [self addSubview:self.topBgView];
    [self addSubview:self.topLineView];
    [self addSubview:self.confirmButton];
    
    [self addSubview:self.deleteButton];
    self.deleteButton.frame = CGRectMake(CTWIDTH - 33 - 5, CTKEYBORDHEIGHT - 12 - 84, 33, 84);
    self.deleteButton.titleLabel.lineBreakMode = UILineBreakModeWordWrap;//换行模式自动换行
    self.deleteButton.titleLabel.numberOfLines = 0;
    
    NSArray *array = [self getShengJsonArray];
    __weak typeof(self) weakself = self;
    [array enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx > 19) return;
        UIButton *button = [[UIButton alloc]init];
        [self addSubview:button];
        [button setTitle:dict[@"name"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.layer.cornerRadius = 3;
        [button addTarget:self action:@selector(selectKeybord:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat leftMargin = 5;
        CGFloat hMargin = 5;
        CGFloat topMargin = 10;
        CGFloat vMargin = 10;
        NSInteger rows =  10;
        CGFloat width = (CTWIDTH - 2 * leftMargin - (rows - 1) * (hMargin))/(CGFloat)rows;
        CGFloat height = 37;
        
        CGFloat buttonX = leftMargin + (hMargin + width) * (idx%rows);
        CGFloat buttonY = CGRectGetMaxY(weakself.confirmButton.frame) + topMargin + (vMargin + height) * (idx/rows);
        CGFloat buttonW = width;
        CGFloat buttonH = height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.backgroundColor = [UIColor redColor];
    }];
    [array enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx < 20) return;
        idx = idx - 20;
        UIButton *button = [[UIButton alloc]init];
        [self addSubview:button];
        [button setTitle:dict[@"name"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.layer.cornerRadius = 3;
        [button addTarget:self action:@selector(selectKeybord:) forControlEvents:UIControlEventTouchUpInside];

        CGFloat leftMargin = 5;
        CGFloat hMargin = 5;
        CGFloat topMargin = 10;
        CGFloat vMargin = 10;
        NSInteger rows =  10;
        CGFloat width = (CTWIDTH - 2 * leftMargin - (rows - 1) * (hMargin))/(CGFloat)rows;
        CGFloat height = 37;
        
        CGFloat buttonX = leftMargin + (hMargin + width) * (idx%(rows - 1));
        CGFloat buttonY = CGRectGetMaxY(weakself.confirmButton.frame) + topMargin + (37 + 10)*2 + (vMargin + height) * (idx/(rows - 1));
        CGFloat buttonW = width;
        CGFloat buttonH = height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.backgroundColor = [UIColor redColor];
    }];
}

- (void)createShengView {
    [self removeAllSubviews];
    [self addSubview:self.topBgView];
    [self addSubview:self.topLineView];
    [self addSubview:self.confirmButton];
    [self addSubview:self.deleteButton];
    self.deleteButton.frame = CGRectMake(CTWIDTH - 66 - 5, CTKEYBORDHEIGHT - 12 - 33, 66, 33);

    NSArray *array = [self getShengJsonArray];
    __weak typeof(self) weakself = self;
    [array enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [[UIButton alloc]init];
        [self addSubview:button];
        [button setTitle:dict[@"name"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.layer.cornerRadius = 3;
        [button addTarget:self action:@selector(selectKeybord:) forControlEvents:UIControlEventTouchUpInside];

        CGFloat leftMargin = 5;
        CGFloat hMargin = 5;
        CGFloat topMargin = 10;
        CGFloat vMargin = 10;
        NSInteger rows = 10;
        CGFloat width = (CTWIDTH - 2 * leftMargin - (rows - 1) * (hMargin))/(CGFloat)rows;
        CGFloat height = 37;
        
        CGFloat buttonX = leftMargin + (hMargin + width) * (idx%rows);
        CGFloat buttonY = CGRectGetMaxY(weakself.confirmButton.frame) + topMargin + (vMargin + height) * (idx/rows);
        CGFloat buttonW = width;
        CGFloat buttonH = height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.backgroundColor = [UIColor redColor];
    }];
}

- (void)selectKeybord:(UIButton *)btn {
    if (self.btnClickBlock) {
        self.btnClickBlock(btn.currentTitle);
    }
}
#pragma mark - other
- (NSArray *)getShengJsonArray {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"shengkey"ofType:@"json"];
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:&error];
    return jsonObject[self.type ? @"jsonLetter" : @"jsonSheng"];
}
- (void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}
@end
