//
//  ShadowViewController.m
//  LPExample
//
//  Created by Simple_Code on leftMargin*1.518/7/25.
//  Copyright © leftMargin*1.518年 咖达. All rights reserved.
//

#import "ShadowViewController.h"

static const CGFloat width = 80;
static const CGFloat leftMargin = 30;
static const CGFloat shadowRadius = 6;
@interface ShadowViewController ()
@property(nonatomic, strong) UIView *view1;
@property(nonatomic, strong) UIView *view2;
@property(nonatomic, strong) UIView *view3;
@property(nonatomic, strong) UIView *bgView1;
@property(nonatomic, strong) UIView *bgView2;
@property(nonatomic, strong) UISlider *slider;
@property(nonatomic, strong) UILabel *shadowOpacityLabel;

@end

@implementation ShadowViewController

#pragma mark - 懒加载
- (UISlider *)slider {
    if (!_slider) {
        UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(leftMargin , 500, [UIScreen mainScreen].bounds.size.width - 2*leftMargin, 50)];
        [self.view addSubview:slider];
        //01.minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
        slider.minimumValue = 0.0;
        //02.maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
        slider.maximumValue = 1.0;
        //03.当前值
        slider.value = 1;
        //04.continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
        [slider setContinuous:YES];
        //05.滑块条最小值处设置的图片，默认为nil
        slider.minimumValueImage = [UIImage imageNamed:@"001.jpeg"];
        //06.滑块条最大值处设置的图片，默认为nil
        slider.maximumValueImage = [UIImage imageNamed:@"001.jpeg"];
        //07.minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
        slider.minimumTrackTintColor = [UIColor redColor];
        //08.maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
        slider.maximumTrackTintColor = [UIColor blueColor];
        //09.thumbTintColor : 当前滑块的颜色，默认为白色
        slider.thumbTintColor = [UIColor yellowColor];
        //    10.currentMaximumTrackImage : 滑块条最大值处设置的图片
        //    11.currentMinimumTrackImage : 滑块条最小值处设置的图片
        //    12.currentThumbImage: 当前滑块的图片
        [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        _slider = slider;
    }
    return _slider;
}
- (void)sliderValueChanged:(UISlider *)slider {
    self.view1.layer.shadowOpacity =
    self.view2.layer.shadowOpacity =
    self.view3.layer.shadowOpacity =
    self.bgView1.layer.shadowOpacity =
    self.bgView2.layer.shadowOpacity = slider.value;
    self.shadowOpacityLabel.text = [NSString stringWithFormat:@"阴影透明度为%.1f\n\n从上往下依次为UIView、UIImageView、UILabel",slider.value];
}
- (UILabel *)shadowOpacityLabel {
    if (!_shadowOpacityLabel) {
        _shadowOpacityLabel = [[UILabel alloc]init];
        _shadowOpacityLabel.frame = CGRectMake(leftMargin , 550, [UIScreen mainScreen].bounds.size.width - 2*leftMargin, 100);
        _shadowOpacityLabel.font = [UIFont systemFontOfSize:16];
        _shadowOpacityLabel.textColor = [UIColor blackColor];
        _shadowOpacityLabel.numberOfLines = 0;
        _shadowOpacityLabel.textAlignment = NSTextAlignmentCenter;
        _shadowOpacityLabel.text = @"阴影透明度为1.0\n\n从上往下依次为UIView、UIImageView、UILabel";
    }
    return _shadowOpacityLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.shadowOpacityLabel];

    [self createViewShadow];
    [self createImageViewShadow];
    [self createLabelShadow];
}
- (void)createViewShadow {
    
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - width * 3 - leftMargin * 2)/2.f;
    UIView *view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(leftMargin, width + leftMargin*1.5, width, width);
    [self.view addSubview:view1];
    self.view1 = view1;
    view1.backgroundColor = [UIColor yellowColor];
    view1.layer.shadowColor = [UIColor blackColor].CGColor;
    view1.layer.shadowOffset = CGSizeMake(-shadowRadius,-shadowRadius);
    view1.layer.shadowOpacity = 1;
    view1.layer.shadowRadius = shadowRadius;
    view1.layer.cornerRadius = shadowRadius;
    view1.layer.masksToBounds = YES;
    view1.clipsToBounds = NO;
    
    UIView *view2 = [[UIView alloc]init];
    view2.frame = CGRectMake(leftMargin + (width + margin), width + leftMargin*1.5, width, width);
    [self.view addSubview:view2];
    self.view2 = view2;
    view2.backgroundColor = [UIColor yellowColor];
    view2.layer.shadowColor = [UIColor blackColor].CGColor;
    view2.layer.shadowOffset = CGSizeMake(0,0);
    view2.layer.shadowOpacity = 1;
    view2.layer.shadowRadius = shadowRadius;
    view2.layer.cornerRadius = shadowRadius;
    view2.layer.masksToBounds = YES;
    view2.clipsToBounds = NO;
    
    UIView *view3 = [[UIView alloc]init];
    view3.frame = CGRectMake(leftMargin + (width + margin)*2, width + leftMargin*1.5, width, width);
    [self.view addSubview:view3];
    self.view3 = view3;
    view3.backgroundColor = [UIColor yellowColor];
    view3.layer.shadowColor = [UIColor blackColor].CGColor;
    view3.layer.shadowOffset = CGSizeMake(shadowRadius,shadowRadius);
    view3.layer.shadowOpacity = 1;
    view3.layer.shadowRadius = shadowRadius;
    view3.layer.cornerRadius = shadowRadius;
    view3.layer.masksToBounds = YES;
    view3.clipsToBounds = NO;
}

- (void)createImageViewShadow {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - width)/2.f, (width + leftMargin*1.5)*2, width, width);
    [self.view addSubview:bgView];
    self.bgView1 = bgView;
    bgView.backgroundColor = [UIColor yellowColor];
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = shadowRadius;
    bgView.layer.cornerRadius = shadowRadius;
    bgView.layer.masksToBounds = YES;
    bgView.clipsToBounds = NO;
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - width)/2.f, (width + leftMargin*1.5 )*2, width, width);
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"shadow.jpg"];
    imageView.layer.cornerRadius = shadowRadius;
    imageView.layer.masksToBounds = YES;
}

- (void)createLabelShadow {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - width)/2.f, (width + leftMargin*1.5)*3, width, width);
    [self.view addSubview:bgView];
    self.bgView2 = bgView;
    bgView.backgroundColor = [UIColor yellowColor];
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = shadowRadius;
    bgView.layer.cornerRadius = shadowRadius;
    bgView.layer.masksToBounds = YES;
    bgView.clipsToBounds = NO;
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - width)/2.f, (width + leftMargin*1.5)*3, width, width);
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = shadowRadius;
    label.layer.masksToBounds = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
