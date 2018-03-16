//
//  SPBlankPageView.m
//  LPExample
//
//  Created by 123456789 on 2018/3/13.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "SPBlankPageView.h"
#import <objc/runtime.h>
#import "Masonry.h"

@interface SPBlankPageView()
@property (weak, nonatomic) UIButton *reloadBtn;
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UILabel *tipLabel;
@property (copy, nonatomic) void(^reloadBlock)(UIButton *sender);
@end

@implementation SPBlankPageView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    self.backgroundColor = newSuperview.backgroundColor;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.mas_offset(frame.size.height * 0.2);
        }];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tipLabel.mas_bottom).offset(10);
            make.width.mas_equalTo(192);
            make.height.mas_equalTo(115);
            make.centerX.offset(0);
        }];
        [self.reloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
            make.left.right.equalTo(self.imageView);
            make.height.mas_equalTo(44);
        }];
    }
    return self;
}

#pragma mark -customFunc
- (void)configWithType:(SPBlankPageViewType)blankPageType
     reloadButtonBlock:(void(^)(UIButton *sender))block {
    
    self.reloadBlock = block;
    
    if (blankPageType == SPBlankPageViewTypeHasError) {
        [self.imageView setImage:[UIImage imageNamed:@"blankpage_13"]];
        self.tipLabel.text = @"貌似出了点差错";
    } else {
        [self.imageView setImage:[UIImage imageNamed:@"blankpage_6"]];
        self.tipLabel.text = @"暂无数据";
    }
}
- (void)reloadClick:(UIButton *)btn {
    !self.reloadBlock ?: self.reloadBlock(btn);
}

#pragma mark -懒加载
- (UIButton *)reloadBtn {
    if(!_reloadBtn)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _reloadBtn = btn;
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        [btn setTitle:@"点击重新加载" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(reloadClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadBtn;
}

- (UIImageView *)imageView {
    if(!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        //imageView.autoPlayAnimatedImage = YES;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)tipLabel {
    if(!_tipLabel)
    {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        _tipLabel = label;
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
    }
    return _tipLabel;
}

@end

#pragma mark - 动态的给UIView添加属性

static char BlankPageViewKey;
@implementation UIView (SPConfigBlank)

- (void)setBlankPageView:(SPBlankPageView *)blankPageView {
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SPBlankPageView *)blankPageView {
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}

- (void)addBlankPageViewWithType:(SPBlankPageViewType)blankPageType
               reloadButtonBlock:(void(^)(id sender))block {
    
    if (blankPageType == SPBlankPageViewTypeHasData) {
        // 如果有数据移除self.blankPageView
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        // 如果没有数据、创建self.blankPageView
        if (!self.blankPageView) {
            self.blankPageView = [[SPBlankPageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        }
        self.blankPageView.hidden = NO;
        [self addSubview:self.blankPageView];
        
        // 配置self.blankPageView上的数据
        [self.blankPageView configWithType:blankPageType reloadButtonBlock:block];
    }
}

@end
