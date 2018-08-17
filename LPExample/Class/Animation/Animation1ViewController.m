//
//  Animation1ViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/8/17.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "Animation1ViewController.h"
typedef NS_ENUM(NSInteger, AnimationViewType) {
    AnimationViewBase = 0,
    AnimationViewBlock
};

@interface Animation1ViewController ()
@property (weak, nonatomic) IBOutlet UIView *test1GreenView;
@property(nonatomic, assign) AnimationViewType type;
@end

@implementation Animation1ViewController

#pragma mark - UIViewApi介绍
/*
 // 开始动画
 // 第一个参数: 动画标识
 // 第二个参数: 附加参数,在设置代理情况下，此参数将发送到setAnimationWillStartSelector和setAnimationDidStopSelector所指定的方法，大部分情况，设置为nil.
 [UIView beginAnimations:(nullable NSString *) context:(nullable void *)];
 
 // 结束动画
 [UIView commitAnimations];
 
 // 动画参数的属性设置:
 //动画持续时间
 [UIView setAnimationDuration:(NSTimeInterval)];
 
 //动画的代理对象
 [UIView setAnimationDelegate:(nullable id)];
 
 //设置动画将开始时代理对象执行的SEL
 [UIView setAnimationWillStartSelector:(nullable SEL)];
 
 //设置动画延迟执行的时间
 [UIView setAnimationDelay:(NSTimeInterval)];
 
 //设置动画的重复次数
 [UIView setAnimationRepeatCount:(float)];
 
 //设置动画的曲线
 UIViewAnimationCurve的枚举值：
 UIViewAnimationCurveEaseInOut,         // 慢进慢出（默认值）
 UIViewAnimationCurveEaseIn,            // 慢进
 UIViewAnimationCurveEaseOut,           // 慢出
 UIViewAnimationCurveLinear             // 匀速
 [UIView setAnimationCurve:(UIViewAnimationCurve)];
 
 //设置是否从当前状态开始播放动画
 //假设上一个动画正在播放，且尚未播放完毕，我们将要进行一个新的动画：
 当为YES时：动画将从上一个动画所在的状态开始播放
 当为NO时：动画将从上一个动画所指定的最终状态开始播放（此时上一个动画马上结束
 [UIView setAnimationBeginsFromCurrentState:YES];
 
 //设置动画是否继续执行相反的动画
 [UIView setAnimationRepeatAutoreverses:(BOOL)];
 
 //是否禁用动画效果（对象属性依然会被改变，只是没有动画效果）
 [UIView setAnimationsEnabled:(BOOL)];
 
 //设置视图的过渡效果
 第一个参数：UIViewAnimationTransition的枚举值如下
 UIViewAnimationTransitionNone,              //不使用动画
 UIViewAnimationTransitionFlipFromLeft,      //从左向右旋转翻页
 UIViewAnimationTransitionFlipFromRight,     //从右向左旋转翻页
 UIViewAnimationTransitionCurlUp,            //从下往上卷曲翻页
 UIViewAnimationTransitionCurlDown,          //从上往下卷曲翻页
 第二个参数：需要过渡效果的View
 第三个参数：是否使用视图缓存，YES：视图在开始和结束时渲染一次；NO：视图在每一帧都渲染
 [UIView setAnimationTransition:(UIViewAnimationTransition) forView:(nonnull UIView *) cache:(BOOL)];
 */



#pragma mark - UIView_BlockApi介绍
- (void)UIViewApiInterduce {
    
    [UIView animateWithDuration:2
                     animations:^{
                         
                     }];
    
    
    [UIView animateWithDuration:2
                     animations:^{
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
    
    /*
     第一个参数：动画持续时间
     第二个参数：动画延迟执行的时间
     第三个参数：动画的过渡效果 UIViewAnimationOptions
     */
    [UIView animateWithDuration:2
                          delay:2
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            
                        } completion:^(BOOL finished) {
                            
                        }];
    /*UIViewAnimationOptions的枚举值如下,可组合使用:
     UIViewAnimationOptionLayoutSubviews            //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction      //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState     //从当前状态开始动画
     UIViewAnimationOptionRepeat                    //无限重复执行动画
     UIViewAnimationOptionAutoreverse               //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedCurve    //忽略嵌套动画的曲线设置
     UIViewAnimationOptionAllowAnimatedContent      //转场：进行动画时重绘视图
     UIViewAnimationOptionShowHideTransitionViews   //转场：移除（添加和移除图层的）动画效果
     UIViewAnimationOptionOverrideInheritedOptions  //不继承父动画设置
     
     UIViewAnimationOptionCurveEaseInOut            //时间曲线，慢进慢出（默认值）
     UIViewAnimationOptionCurveEaseIn               //时间曲线，慢进
     UIViewAnimationOptionCurveEaseOut              //时间曲线，慢出
     UIViewAnimationOptionCurveLinear               //时间曲线，匀速
     
     UIViewAnimationOptionTransitionNone            //转场，不使用动画
     UIViewAnimationOptionTransitionFlipFromLeft    //转场，从左向右旋转翻页
     UIViewAnimationOptionTransitionFlipFromRight   //转场，从右向左旋转翻页
     UIViewAnimationOptionTransitionCurlUp          //转场，下往上卷曲翻页
     UIViewAnimationOptionTransitionCurlDown        //转场，从上往下卷曲翻页
     UIViewAnimationOptionTransitionCrossDissolve   //转场，交叉消失和出现
     UIViewAnimationOptionTransitionFlipFromTop     //转场，从上向下旋转翻页
     UIViewAnimationOptionTransitionFlipFromBottom  //转场，从下向上旋转翻页
     */
    
    
    // ios7.0以后新增了Spring动画(IOS系统动画大部分采用Spring Animation， 适用所有可被添加动画效果的属性)
    /*
     第一个参数：动画持续时间
     第二个参数：动画延迟执行的时间
     第三个参数：震动效果，范围0~1，数值越小震动效果越明显
     第四个参数：初始速度，数值越大初始速度越快
     第五个参数：动画的过渡效果 UIViewAnimationOptions
     */
    [UIView animateWithDuration:2
                          delay:2
         usingSpringWithDamping:0.2
          initialSpringVelocity:0.4
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            
                        } completion:^(BOOL finished) {
                            
                        }];
    
    
    // IOS7.0后新增了关键帧动画，支持属性关键帧，不支持路径关键帧
    /*
     第一个参数：动画持续时间
     第二个参数：动画延迟执行的时间
     第三个参数：动画的过渡效果 UIViewAnimationOptions
     */
    [UIView animateKeyframesWithDuration:2
                                   delay:2
                                 options:0 animations:^{
                                     
                                 } completion:^(BOOL finished) {
                                     
                                 }];
    
    
    /*
     第一个参数：动画开始的时间（占总时间的比例）
     第二个参数：动画持续时间（占总时间的比例）
     */
    [UIView addKeyframeWithRelativeStartTime:2
                            relativeDuration:2 animations:^{
                                
                            }];
    
    
    
    // 转场动画:
    //1.从旧视图到新视图的动画效果
    [UIView transitionFromView:self.view
                        toView:self.view
                      duration:2
                       options:0
                    completion:^(BOOL finished) {
                        
                    }];
    /* - 上面类似于
     [fromView.superview addSubview:toView];
     [fromView removeFromSuperview];
     */
    
    //2.单个视图的过渡效果
    [UIView transitionWithView:self.view
                      duration:2
                       options:0 animations:^{
                           
                       } completion:^(BOOL finished) {
                           
                       }];
}

#pragma mark - 页面加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *tuch = touches.anyObject;
    CGPoint point = [tuch locationInView:self.view];
    
    [self animationExample1:point with:AnimationViewBlock];
    //[self animationExample2];

}

#pragma mark - 例子
- (void)animationExample1:(CGPoint)point with:(AnimationViewType)type {
    
    switch (type) {
        case AnimationViewBase:
        {
            [UIView beginAnimations:@"testAnimation1" context:nil];
            [UIView setAnimationDuration:3.0];
            [UIView setAnimationDelegate:self];
            
            //设置动画将开始时代理对象执行的SEL
            [UIView setAnimationWillStartSelector:@selector(animationBegin)];
            
            //设置动画延迟执行的时间
            [UIView setAnimationDelay:0];
            
            [UIView setAnimationRepeatCount:MAXFLOAT];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            
            //设置动画是否继续执行相反的动画
            [UIView setAnimationRepeatAutoreverses:YES];
            self.test1GreenView.center = point;
            self.test1GreenView.transform = CGAffineTransformMakeScale(1.5, 1.5);
            self.test1GreenView.transform = CGAffineTransformMakeRotation(M_PI);
            
            [UIView commitAnimations];
        }
            break;
        case AnimationViewBlock:
        {
            [UIView animateWithDuration:3.0 animations:^{
                
                self.test1GreenView.center = point;
                self.test1GreenView.transform = CGAffineTransformMakeScale(1.5, 1.5);
                self.test1GreenView.transform = CGAffineTransformMakeRotation(M_PI);
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:2.0 animations:^{
                    self.test1GreenView.frame = CGRectMake(100, 100, 100, 100);
                    self.test1GreenView.transform = CGAffineTransformMakeScale(1 / 1.5,1 / 1.5);
                    self.test1GreenView.transform = CGAffineTransformMakeRotation(M_PI);
                }];
                
            }];
        }
            break;
            
        default:
            break;
    }
   
    
    

    
}
- (void)animationBegin {
    NSLog(@"%@",@"动画开始了");
}

- (void)animationExample2 {
    [UIView beginAnimations:@"testAnimation2" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.test1GreenView cache:YES];
    [UIView commitAnimations];
}

- (void)restoreRootViewController:(UIViewController *)rootViewController {
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    } completion:nil];
}


@end
