//
//  Animation2ViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/8/17.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "Animation2ViewController.h"


#define kWindowWidth [UIScreen mainScreen].bounds.size.width
#define kWindowHeight [UIScreen mainScreen].bounds.size.height

@interface Animation2ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;
@property (weak, nonatomic) IBOutlet UIView *view6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation Animation2ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self view1Animation];
    [self view2Animation];
    [self view3Animation];
    [self view7Animation];
    [self view8Animation];

    

}
/*
CABasicAnimation：只能从一个数值（fromValue）变到另一个数值（toValue）
CAKeyframeAnimation：会使用一个NSArray保存这些数值
 */
/*相关属性
 keyPath ： 要改变的属性名称（传字符串）
 fromValue：keyPath相应属性的初始值
 toValue：  keyPath相应属性的结束值
 */
/*
 keyPath
 要改变的属性名称(传字符串)
 
 FromValue
 设置动画的初始值
 
 ToValue
 设置动画的到达值
 
 Autoreverses
 设定这个属性为 YES 时,在它到达目的地之后,动画的返回到开始的值,代替了直接跳转到开始的值，过渡平滑
 
 Duration
 设定开始值到结束值花费的时间。期间会被速度的属性所影响
 
 RepeatCount
 默认的是 0,动画只会播放一次。如果指定一个无限大的重复次数,使用 MAXFLOAT 。这个不应该和 repeatDration 属性一块使用
 
 RepeatDuration
 这个属性指定了动画应该被重复多久。动画会一直重复,直到设定的时间用完。同上它不应该和 repeatCount 一起使用
 
 RemovedOnCompletion
 这个属性默认为 YES,在指定的时间段完成后,动画就自动的从层上移除了
 
 FillMode
 这个属性一般和 RemovedOnCompletion 配合使用，保持动画状态。其中kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态.此时将RemovedOnCompletion设为NO
 
 Speed
 默认的值为 1.0.如果你改变这个值为 2.0,动画会用 2 倍的速度播放。这样的影响就是使持续时间减半。如果你指定的持续时间为 6 秒,速度为 2.0,动画就会播放 3 秒钟即一半的持续时间。
 
 TimingFunction
 控制动画运行的节奏.
 kCAMediaTimingFunctionLinear（线性）：匀速，给你一个相对静态的感觉 k
 CAMediaTimingFunctionEaseIn（渐进）：动画缓慢进入，然后加速离开
 kCAMediaTimingFunctionEaseOut（渐出）：动画全速进入，然后减速的到达目的地
 kCAMediaTimingFunctionEaseInEaseOut（渐进渐出）：动画缓慢的进入，中间加速，然后减速的到达目的地。这个是默认的动画行为。
 
 BeginTime
 可以用来设置动画延迟执行时间，若想延迟1s，就设置为CACurrentMediaTime()+1，CACurrentMediaTime()为图层的当前时间
 
 */
#pragma mark - CABasicAnimation-基本动画
- (void)view1Animation {
    // 呼吸动画
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    animation.autoreverses = YES;    //回退动画（动画可逆，即循环）
    animation.duration = 1.0f;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;//removedOnCompletion,fillMode配合使用保持动画完成效果
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.view1.layer addAnimation:animation forKey:@"aAlpha"];
}
- (void)view2Animation {
    
    // 设置旋转原点
    self.view2.layer.anchorPoint = CGPointMake(0.5, 0);
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //角度转弧度（这里用1，-1简单处理一下）
    rotationAnimation.toValue = [NSNumber numberWithFloat:1];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:-1];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.autoreverses = YES;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.fillMode = kCAFillModeForwards;
    [self.view2.layer addAnimation:rotationAnimation forKey:@"revItUpAnimation"];
}
- (void)view3Animation {
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.duration = 0.8;//动画时间
    //动画起始值和终止值的设置
    moveAnimation.fromValue = @(180);
    moveAnimation.toValue = @(130);
    //一个时间函数，表示它以怎么样的时间运行
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.repeatDuration = 100;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面有可以拿到这个动画的标识
    [self.view3.layer addAnimation:moveAnimation forKey:@"view3Animation"];
}

#pragma mark - CAKeyframeAnimation-关键帧动画
- (void)view4Animation {
    //values方式实现
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kWindowWidth - 50, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kWindowWidth - 50, kWindowHeight-50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, kWindowHeight-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    animation.values = @[value1,value2,value3,value4,value5];
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 6.0f;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.view4.layer addAnimation:animation forKey:@"values"];

}
- (void)view5Animation {
    // path方式实现
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    CGMutablePathRef path = CGPathCreateMutable();
    //矩形线路
    CGPathAddRect(path, NULL, CGRectMake(50,100, kWindowWidth - 50,kWindowHeight - 50));
    animation.path=path;
    CGPathRelease(path);
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 6.0f;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.view4.layer addAnimation:animation forKey:@"path"];
    
}
- (void)view6Animation {
    
    //keyTimes演示
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //animation.keyPath = @"transform.translation.x";
    animation.keyPath = @"position.x";
    animation.values   = @[@0, @20, @-20, @20, @0];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 6;
    animation.additive = YES;
    [self.view4.layer addAnimation:animation forKey:@"keyTimes"];
    
}
- (void)view7Animation {
    
    //创建路径
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 450)];
    [bezierPath addCurveToPoint:CGPointMake(370, 500) controlPoint1:CGPointMake(350, 200) controlPoint2:CGPointMake(300, 600)]; //一个曲线
    //路径样式
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor; //填充色<默认黑色>
    shapeLayer.strokeColor = [UIColor blueColor].CGColor; //线色
    shapeLayer.lineWidth = 2;
    [self.view.layer addSublayer:shapeLayer];
    
    CAKeyframeAnimation *animaiton = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSArray *rotationVelues = @[@(M_PI_4), @(-M_PI_4), @(M_PI_4)];
    animaiton.values = rotationVelues;
    animaiton.rotationMode = kCAAnimationRotateAuto;  //方向
    animaiton.duration = 3.0f;
    animaiton.keyTimes = @[@0.2 ,@0.8 ,@1];
    animaiton.path = bezierPath.CGPath;
    animaiton.repeatCount = HUGE_VALF;     //   #define    HUGE_VALF    1e50f
    [self.view4.layer addAnimation:animaiton forKey:@"path"];
    
}
#pragma mark - 画CAAnimationGroup——动画组
- (void)view8Animation {
    
    CABasicAnimation * animationScale = [CABasicAnimation animation];
    animationScale.keyPath = @"transform.scale";
    animationScale.toValue = @(0.1);
    
    CABasicAnimation *animationRota = [CABasicAnimation animation];
    animationRota.keyPath = @"transform.rotation";
    animationRota.toValue = @(M_PI_2);
    
    CAAnimationGroup * group = [[CAAnimationGroup alloc] init];
    group.duration = 3.0;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.repeatCount = MAXFLOAT;
    
    group.animations = @[animationScale,animationRota];
    [self.view5.layer addAnimation:group forKey:nil];
}
- (void)view9Animation {
    
    CATransition *caTransition = [CATransition animation];
    caTransition.duration = 0.5;
    caTransition.delegate = self;
    caTransition.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];//切换时间函数
    caTransition.type = kCATransitionReveal;//动画切换风格
    caTransition.subtype = kCATransitionFromLeft;//动画切换方向
    
    //子视图交换位置
    [self.view6 exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //动画在父视图
    [self.view6.layer addAnimation:caTransition forKey:@"Key"];
}

#pragma mark - 转场动画——CATransition
/*
 CATransition是CAAnimation的子类，用于做转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。iOS比Mac OS X的转场动画效果少一点
 UINavigationController就是通过CATransition实现了将控制器的视图推入屏幕的动画效果
 动画属性:(有的属性是具备方向的,详情看下图)
 
 type
 动画过渡类型
 
 subtype
 动画过渡方向
 
 startProgress
 动画起点(在整体动画的百分比)
 
 endProgress
 动画终点(在整体动画的百分比)

 */
- (void)view10Animation {
    self.imageView.userInteractionEnabled = YES;
    //添加手势
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:rightSwipe];
    
}
static int _imageIndex = 0;
- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    
    //转场代码与转场动画必须得在同一个方法当中.
    NSString *dir = nil;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        _imageIndex++;
        if (_imageIndex > 4) {
            _imageIndex = 0;
        }
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",_imageIndex];
        self.imageView.image = [UIImage imageNamed:imageName];
        
        dir = @"fromRight";
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        _imageIndex--;
        if (_imageIndex < 0) {
            _imageIndex = 4;
        }
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",_imageIndex];
        self.imageView.image = [UIImage imageNamed:imageName];
        
        dir = @"fromLeft";
    }
    
    //添加动画
    CATransition *anim = [CATransition animation];
    //设置转场类型
    anim.type = @"cube";
    //设置转场的方向
    anim.subtype = dir;
    anim.duration = 0.5;
    //动画从哪个点开始
    //anim.startProgress = 0.2;
    //anim.endProgress = 0.3;
    [self.imageView.layer addAnimation:anim forKey:nil];
}

@end
