//
//  ADView.m
//  9-04ADViewDemo
//
//  Created by XXX on 16/4/21.
//  Copyright © 2016年 XXX. All rights reserved.
//

#import "ADView.h"
static const NSTimeInterval TimeInterval = 4;

@interface ADView()<UIScrollViewDelegate>
{
    NSInteger _currentPage; //记录真实的页码数
    NSTimer *_timer;  //生命一个全局变量
}
@property (nonatomic,assign) BOOL isRun;

@property (nonatomic,strong) NSMutableArray *imageArray;//存储图片的名字
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,assign) CGFloat width;//view的宽
@property (nonatomic,assign) CGFloat height;//view的高
@property (nonatomic,assign) CGFloat scrWidth;//scrollViewWidth
@property (nonatomic,assign) CGFloat imgWidth;//imageViewWidth
@property (nonatomic,assign) CGFloat distance;//设置Scroll距离View两侧距离
@property (nonatomic,assign) CGFloat halfGap;//设置Scroll内部 图片间距

@property (nonatomic,copy) SendNameBlock block;//声明一个属性，保证生命周期，方便其它函数调用
@end

@implementation ADView

#pragma mark - 页面初始化
- (id)initWithFrame:(CGRect)frame andDistanceForScroll:(float)distance andGap:(float)gap andImageNameArray:(NSMutableArray *)imageNameArray andIsRunning:(BOOL)isRunning andBlock:(SendNameBlock)block {
    // 迭代开发
    _distance = distance;
    _halfGap = gap / 2.f;
    self = [self initWithFrame:frame andImageNameArray:imageNameArray andIsRunning:isRunning];
    self.block = block;
    return self;
}
- (id)initWithFrame:(CGRect)frame andImageNameArray:(NSMutableArray *)imageNameArray andIsRunning:(BOOL)isRunning andBlock:(SendNameBlock)block {
    // 迭代开发
    self = [self initWithFrame:frame andImageNameArray:imageNameArray andIsRunning:isRunning];
    self.block = block;
    return self;
}
- (id)initWithFrame:(CGRect)frame andImageNameArray:(NSMutableArray *)imageNameArray andIsRunning:(BOOL)isRunning {
    self = [super initWithFrame:frame];
    if (self) {

        // 1.设置尺寸
        _width = self.frame.size.width;
        _height = self.frame.size.height;
        _distance = _distance == 0 ? 0 : _distance;
        _halfGap = _halfGap == 0 ? 0 : _halfGap;
        _scrWidth = self.frame.size.width - 2 * _distance;
        _imgWidth = _scrWidth - 2 * _halfGap;
        
        // 2.重组数组
        // arrayWithArray 把数组中的内容放到一个数组中返回
        self.imageArray = [NSMutableArray arrayWithArray:imageNameArray];
        // 在数组的尾部添加原数组第一个元素
        [self.imageArray addObject:[imageNameArray firstObject]];
        // 在数组的首部添加原数组最后一个元素
        [self.imageArray insertObject:[imageNameArray lastObject] atIndex:0];

        // 3.设置是否支持滚动
        self.isRun = isRunning;
        _currentPage = 0;

        // 4.创建UI
        [self createScrollView];
        [self createPageControl];
        [self createTimer];

    }
    return self;
}
#pragma mark - 创建定时器
- (void)createTimer {
    
    if (_isRun == YES) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:TimeInterval target:self selector:@selector(change) userInfo:nil repeats:YES ];
        //当前的runloop同时处理两个输入源
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
  
}
- (void)change {
    // 1.获得当前的点
    CGPoint point = _scrollView.contentOffset;
    // 2.求得将要变换的点
    CGPoint endPoint = CGPointMake(point.x + _scrWidth, 0);
    
    // 3.判断改变页面的位置
    if (endPoint.x == (self.imageArray.count-1) * _scrWidth) {
        [UIView animateWithDuration:0.25 animations:^{
            _scrollView.contentOffset = CGPointMake(endPoint.x, 0);

        } completion:^(BOOL finished) {
            
            // 动画完成的block
            _scrollView.contentOffset = CGPointMake(_scrWidth, 0);
            CGPoint realEnd = _scrollView.contentOffset;
            
            // 取一遍页码数
            _currentPage = realEnd.x / _scrWidth;
            _pageControl.currentPage = _currentPage-1;
        }];
    }
    else{
        // 0.25s中更改一个图片
        [UIView animateWithDuration:0.25 animations:^{
            _scrollView.contentOffset = endPoint;
        } completion:^(BOOL finished) {
        }];
        
        CGPoint realEnd = _scrollView.contentOffset;
        // 取一遍页码数
        _currentPage = realEnd.x / _scrWidth;
        _pageControl.currentPage = _currentPage-1;
    }
}

#pragma mark - 创建页码指示器
- (void)createPageControl {
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, _height - 30, _scrWidth, 30)];
    _pageControl.numberOfPages = self.imageArray.count - 2;
    //_pageControl.pageIndicatorTintColor = [UIColor redColor];
    //_pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_pageControl];
}

#pragma mark - 创建滚动视图
- (void)createScrollView {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(_distance, 0, _scrWidth, _height)];
    _scrollView.contentSize = CGSizeMake(_scrWidth * self.imageArray.count, 0);
    for (int i = 0; i < self.imageArray.count; i++) {
        
        CGFloat imageViewW = _imgWidth;
        CGFloat imageViewH = _height;
        CGFloat imageViewX = (i * 2 + 1) * _halfGap + i * imageViewW;// 注.这是控制两边留边的主要算法
        CGFloat imageViewY = 0;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
        if ([self.imageArray[i] hasPrefix:@"http"]) {
            // 网络图片--具体使用SDWebImage
        
        }else{
            // 本地图片
            imageView.image = [UIImage imageNamed:self.imageArray[i]];
        }
        // 打开用户交互属性
        imageView.userInteractionEnabled = YES;
        // 设置tag值
        imageView.tag = 200 + i;
        // 创建点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [imageView addGestureRecognizer:tap];
        
        [_scrollView addSubview:imageView];
    }
    
    // 水平指示条不显示
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 关闭弹簧效果
    _scrollView.bounces = NO;
    // 设置用户看到第一张
    _scrollView.contentOffset = CGPointMake(_scrWidth, 0);
    // 设置代理
    _scrollView.delegate = self;
    // 分页效果
    _scrollView.pagingEnabled = YES;
    // 超出部分不能被裁减
    _scrollView.clipsToBounds = NO;
    [self addSubview:_scrollView];
    
    _scrollView.backgroundColor = [UIColor redColor];
}
// 点击手势触发的协议方法
- (void)tap:(UITapGestureRecognizer *)tap {
    NSInteger tag = tap.view.tag;
    NSString *str = self.imageArray[tag - 200];
    // 使用block
    if (self.block) {
        self.block(str);
    }
}
#pragma mark UIScrollViewDelegate
// 停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_timer) {
        [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:TimeInterval]];
    }
    // 图片的个数  1 2 3 4 5 6 7 8
    // 真实的页码  0 1 2 3 4 5 6 7
    // 图片的名字  6 1 2 3 4 5 6 1
    // 显示的页码    0 1 2 3 4 5
    CGPoint point = _scrollView.contentOffset;
    
    if (point.x == (self.imageArray.count - 1) * _scrWidth) {
        scrollView.contentOffset = CGPointMake(_scrWidth, 0);
    }
    if (point.x == 0) {
        scrollView.contentOffset = CGPointMake((self.imageArray.count - 2) * _scrWidth, 0);
    }
    
    // 取一遍页码数
    CGPoint endPoint = scrollView.contentOffset;
    _currentPage = endPoint.x / _scrWidth;
    _pageControl.currentPage = _currentPage - 1;
}
// 手指开始触摸的时候，停止计时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_timer) {
        //如果有，停掉
        [_timer setFireDate:[NSDate distantFuture]];
    }
}
@end
