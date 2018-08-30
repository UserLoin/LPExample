//
//  LiMingDemoViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/8/30.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "LiMingDemoViewController.h"
#import "LiMingContentViewController.h"

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

static CGFloat const halfDistance = 40;
static CGFloat const halfGap = 10;

@interface LiMingDemoViewController ()<UIScrollViewDelegate>
/** UIScrollView */
@property(nonatomic,weak)UIScrollView *scrollView;
@end

@implementation LiMingDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildViewControllers];
    [self setupScrollView];
    // 默认添加子控制器的view
    //[self addChildVcView];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildVcViewWith:idx];
    }];
}
/**
 *  添加子控制器
 */
- (void)setupChildViewControllers{
    
    for (int i = 0; i < 5; i++) {
        LiMingContentViewController *oneVc = [[LiMingContentViewController alloc]init];
        oneVc.view.backgroundColor = [UIColor redColor];
        [self addChildViewController:oneVc];
    }
}
/**
 *  创建 ScrollView
 */
- (void)setupScrollView{
    //不允许自动调整scrollerView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView  alloc]init];
    scrollView.frame = CGRectMake(halfDistance, 64, SCREENW - 2 * halfDistance, 600);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.clipsToBounds = NO;
    
    // 添加所有子控制器的view到scrollView中
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.frame.size.width, 0);
    
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
}
#pragma mark - 添加子控制器的view
- (void)addChildVcViewWith:(NSInteger)index
{
    // 取出子控制器
    LiMingContentViewController *childVc = self.childViewControllers[index];
    //已经加载过就不用再次加载
    //if ([childVc isViewLoaded]) return;
    
    CGFloat ViewW = self.scrollView.frame.size.width - 2 * halfGap;
    CGFloat ViewH = 600;
    CGFloat ViewX = (index * 2 + 1) * halfGap + index * ViewW;// 注.这是控制两边留边的主要算法
    CGFloat ViewY = 0;
    childVc.view.frame = CGRectMake(ViewX, ViewY, ViewW, ViewH);
    [self.scrollView addSubview:childVc.view];
    
}
//- (void)addChildVcView
//{
//    // 子控制器的索引
//    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
//
//    // 取出子控制器
//    LiMingContentViewController *childVc = self.childViewControllers[index];
//    //已经加载过就不用再次加载
//    //if ([childVc isViewLoaded]) return;
//
//    CGFloat ViewW = self.scrollView.frame.size.width - 2 * halfGap;
//    CGFloat ViewH = 600;
//    CGFloat ViewX = (index * 2 + 1) * halfGap + index * ViewW;// 注.这是控制两边留边的主要算法
//    CGFloat ViewY = 0;
//    childVc.view.frame = CGRectMake(ViewX, ViewY, ViewW, ViewH);
//    [self.scrollView addSubview:childVc.view];
//
//}
#pragma mark - <UIScrollViewDelegate>
///**
// * 在scrollView滚动动画结束时, 就会调用这个方法
// * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
// */
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//    [self addChildVcView];
//}
//
///**
// * 在scrollView滚动动画结束时, 就会调用这个方法
// * 前提: 人为拖拽scrollView产生的滚动动画
// */
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    // 添加子控制器的view
//    [self addChildVcView];
//}
@end
