//
//  SDSelectBarController.m
//  SDSelectBarController
//
//  Created by 孙号斌 on 2017/1/17.
//  Copyright © 2017年 孙号斌. All rights reserved.
//
#define RGB_VALUE(value)        ([UIColor colorWithRed:((float)((value&0xFF0000)>>16))/255.0f \
green:((float)((value&0xFF00)>>8))/255.0f \
blue:((float)(value&0xFF))/255.0f \
alpha:1.0f])

#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

#import "SDSelectBarController.h"
#import "UIViewAdditions.h"

const CGFloat SDTitlesInterval = 20;
const CGFloat SDIndicateHeight = 2.0f;

@interface SDSelectBarController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *titlesScrollView;
@property (nonatomic, strong) UIScrollView *contentsScrollView;
@property (nonatomic, strong) UIView *indicateView;


@property (nonatomic, strong) NSMutableArray *titlesWidthArr;
@property (nonatomic, strong) NSMutableArray *titlesButtonArr;
@property (nonatomic, strong) NSMutableArray *titlesArr;

@property (nonatomic, strong) UIButton *currentTitleButton;
@property (nonatomic, strong) UIButton *nextTitleButton;

@property (nonatomic, assign) NSInteger nextIndex;
@property (nonatomic, assign) CGFloat currentProgress;
@end


@implementation SDSelectBarController


- (instancetype)initWithTitlesFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI
{
    _titleNormalColor = RGB_VALUE(0x666666);
    _titleSelectColor = RGB_VALUE(0x333333);
    _haveIndicator = YES;
    _titleFont = [UIFont systemFontOfSize:16];
    _indicatorColor = RGB_VALUE(0x333333);
    _selectedIndex = 0;
    
    /*************** 创建标题的滚动视图 ***************/
    self.titlesScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.titlesScrollView.showsVerticalScrollIndicator = NO;
    self.titlesScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.titlesScrollView];
    
    
    /*************** 创建指示器视图 ***************/
    _indicateView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-SDIndicateHeight, 0, SDIndicateHeight)];
    _indicateView.backgroundColor = _indicatorColor;
    [self.titlesScrollView addSubview:_indicateView];
    
    /*************** 创建内容的滚动视图 ***************/
    CGFloat selfBottom = self.top+self.height;
    _contentsScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, selfBottom, SCREEN_WIDTH, SCREEN_HEIGHT-selfBottom)];
    _contentsScrollView.showsHorizontalScrollIndicator = NO;
    _contentsScrollView.showsVerticalScrollIndicator = NO;
    _contentsScrollView.bounces = NO;
    _contentsScrollView.delegate = self;
    _contentsScrollView.pagingEnabled = YES;
    
    
    /*************** 初始化数组 ***************/
    _titlesWidthArr = [NSMutableArray array];
    _titlesButtonArr = [NSMutableArray array];
    _titlesArr = [NSMutableArray array];
}

- (void)createTitlesButtonArrView:(NSArray *)titles
{
    if (titles.count == 0)
    {
        return;
    }
    
    for (UIButton *button in _titlesButtonArr)
    {
        [button removeFromSuperview];
    }
    [_titlesButtonArr removeAllObjects];
    
    
    
    /*************** 创建Button ***************/
    CGFloat buttonHeight = self.height - SDIndicateHeight;
    CGFloat buttonWidth = 0.0f;
    CGFloat buttonX = 0.0f;
    for (NSInteger i = 0; i < _titlesArr.count; i++)
    {
        buttonWidth = [[_titlesWidthArr objectAtIndex:i] floatValue];
        
        UIButton *itemBtn = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, 0, buttonWidth, buttonHeight)];
        [itemBtn setTitle:[_titlesArr objectAtIndex:i] forState:UIControlStateNormal];
        [itemBtn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        [itemBtn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        [itemBtn addTarget:self
                    action:@selector(itemButtonAction:)
          forControlEvents:UIControlEventTouchUpInside];
        itemBtn.tag = 10 + i;
        itemBtn.selected = NO;
        itemBtn.titleLabel.font = _titleFont;

        [_titlesButtonArr addObject:itemBtn];
        [_titlesScrollView addSubview:itemBtn];
        
        buttonX = buttonX + buttonWidth;
    }
}

- (void)addViewContollerToContentViewWithIndex:(NSInteger)index
{
    UIViewController *selectedVC = _viewControllers[index];
    
    if ([selectedVC isViewLoaded])
    {
        return;
    }
    
    selectedVC.view.frame = CGRectMake(SCREEN_WIDTH*index, 0, SCREEN_WIDTH, CGRectGetHeight(_contentsScrollView.frame));
    
    [_contentsScrollView  addSubview:selectedVC.view];
    [self.viewController addChildViewController:selectedVC];
}


#pragma mark - 重写setter方法
- (void)setHaveIndicator:(BOOL)haveIndicator
{
    _haveIndicator = haveIndicator;
    if (!haveIndicator)
    {
        [_indicateView removeFromSuperview];
    }
}
- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    _titleNormalColor = titleNormalColor;
    if (_titlesArr.count != 0)
    {
        for (UIButton *button in _titlesButtonArr)
        {
            [button setTitleColor:titleNormalColor forState:UIControlStateNormal];
        }
    }
}
- (void)setTitleSelectColor:(UIColor *)titleSelectColor
{
    _titleSelectColor = titleSelectColor;
    if (_titlesArr.count != 0)
    {
        for (UIButton *button in _titlesButtonArr)
        {
            [button setTitleColor:titleSelectColor forState:UIControlStateSelected];
        }
    }
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    
    [self calculateTextsWidthWithTexts:_titlesArr];
    [self createTitlesButtonArrView:_titlesArr];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    _titlesArr = [self getViewControllerTitles:_viewControllers];
    
    //计算title是的宽度和titlesScrollView的ContentSize
    [self calculateTextsWidthWithTexts:_titlesArr];
    [self createTitlesButtonArrView:_titlesArr];
    
    //创建内容视图的contentSize
    _contentsScrollView.contentSize = CGSizeMake(viewControllers.count*SCREEN_WIDTH, 0);
}

-(void)setIndicatorHeight:(CGFloat)indicatorHeight{
    _indicatorHeight=indicatorHeight;
    _indicateView.frame=CGRectMake(0, self.height-indicatorHeight, _indicateView.width, indicatorHeight);
}



#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.currentTitleButton = [_titlesScrollView viewWithTag:10+_selectedIndex];
    self.currentTitleButton.selected = YES;
    
    [self.viewController.view addSubview:_contentsScrollView];
    
    //
    [self addViewContollerToContentViewWithIndex:_selectedIndex];
    [self.contentsScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * _selectedIndex, 0) animated:NO];
    
    //设置指示器的颜色和位置
    _indicateView.backgroundColor = _indicatorColor;
    _indicateView.width = [_titlesWidthArr[_selectedIndex] floatValue];
    _indicateView.left = _currentTitleButton.left;
    
    //设置titlesScrollView的位置
    [self.titlesScrollView scrollRectToVisible:CGRectMake(_currentTitleButton.left-(self.width-_currentTitleButton.width)/2, 0, self.width, self.height) animated:NO];

}


#pragma mark - 按钮的点击事件
- (void)itemButtonAction:(UIButton *)button
{
    [self showViewControllerWithIndex:button.tag-10];
}

- (void)showViewControllerWithIndex:(NSInteger)index
{
    BOOL change = YES;
    if ([_myDelegate respondsToSelector:@selector(barControlWillClickItemWithIndex:)])
    {
        change = [_myDelegate barControlWillClickItemWithIndex:index];
    }
    
    if (!change)
    {
        return;
    }
    
    UIButton *button = [_titlesButtonArr objectAtIndex:index];
    
    _currentTitleButton.selected = NO;
    button.selected = YES;
    _currentTitleButton = button;
    
    [self addViewContollerToContentViewWithIndex:index];
    [self.contentsScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * (button.tag - 10), 0) animated:NO];
    
    
    CGRect rect = button.frame;
    CGSize size = self.frame.size;
    [UIView animateWithDuration:0.3 animations:^{
        self.indicateView.frame = CGRectMake(button.left, self.height-_indicatorHeight, button.width, _indicatorHeight);
    } completion:^(BOOL finished) {
        [self.titlesScrollView scrollRectToVisible:CGRectMake(rect.origin.x-(size.width-rect.size.width)/2, 0, size.width, size.height) animated:YES];
        self.selectedIndex = button.tag - 10;
    }];
}




#pragma mark - scrollView的Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    BOOL change = YES;
    if ([_myDelegate respondsToSelector:@selector(barControlWillClickItemWithIndex:)])
    {
        change = [_myDelegate barControlWillClickItemWithIndex:1];
    }
    
    if (!change)
    {
        scrollView.scrollEnabled = NO;
    }
    scrollView.scrollEnabled = YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger selectedIndex = self.currentTitleButton.tag - 10;
    
    
    if (scrollView.contentOffset.x > (selectedIndex * SCREEN_WIDTH))//向左滑
    {
        _nextIndex = selectedIndex+1;
        _nextTitleButton = _titlesButtonArr[_nextIndex];
        
        _currentProgress = (scrollView.contentOffset.x - SCREEN_WIDTH*selectedIndex)/SCREEN_WIDTH;
        _indicateView.left = _currentTitleButton.left + _currentTitleButton.width*_currentProgress;
        _indicateView.width = _currentTitleButton.width + (_nextTitleButton.width-_currentTitleButton.width)*_currentProgress;
    }
    else if (scrollView.contentOffset.x < (selectedIndex * SCREEN_WIDTH))//向右滑
    {
        _nextIndex = selectedIndex-1;
        
        _nextTitleButton = _titlesButtonArr[_nextIndex];
        
        _currentProgress = (scrollView.contentOffset.x - SCREEN_WIDTH*selectedIndex)/SCREEN_WIDTH;
        _indicateView.left = _currentTitleButton.left + _nextTitleButton.width*_currentProgress;
        _indicateView.width = _currentTitleButton.width + (_nextTitleButton.width-_currentTitleButton.width)*fabs(_currentProgress);
        
    }


    if (fabs(_currentProgress) <= 0.75 && fabs(_currentProgress) >= 0.25)
    {
        [self addViewContollerToContentViewWithIndex:_nextIndex];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger currentIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    
    if (currentIndex != _selectedIndex)
    {
        _currentTitleButton.selected = NO;
        _currentTitleButton = _titlesButtonArr[currentIndex];
        _currentTitleButton.selected = YES;
        _selectedIndex = currentIndex;
        
        _indicateView.left = _currentTitleButton.left;
        _indicateView.width = _currentTitleButton.width;
        
        [self.titlesScrollView scrollRectToVisible:CGRectMake(_currentTitleButton.left-(self.width-_currentTitleButton.width)/2, 0, self.width, self.height) animated:YES];
    }
}




#pragma mark - common utils
- (NSMutableArray *)getViewControllerTitles:(NSArray *)viewControllers
{
    NSMutableArray *array = [NSMutableArray array];
    for (UIViewController *vc in viewControllers)
    {
        [array addObject:vc.title];
    }
    return array;
}

- (void)calculateTextsWidthWithTexts:(NSArray *)textArray
{
    if (textArray.count == 0)
    {
        return;
    }
    [_titlesWidthArr removeAllObjects];
    
    
    self.titlesScrollView.bounces = YES;
    
    CGSize size = CGSizeZero;
    CGFloat textWidth = 0.0f;
    CGFloat totalWidth = 0.0f;
    for (NSString *text in textArray)
    {
        size =[self sizeOfString:text withWidth:MAXFLOAT font:_titleFont];
        textWidth = size.width + SDTitlesInterval;
        
        totalWidth += textWidth;
        [_titlesWidthArr addObject:[NSNumber numberWithFloat:textWidth]];
    }
    self.titlesScrollView.contentSize = CGSizeMake(totalWidth, self.height);
    
    
    if (totalWidth < self.width)
    {
        [_titlesWidthArr removeAllObjects];
        
        NSNumber *width = [NSNumber numberWithFloat:self.width / textArray.count];
        for (int i = 0; i < textArray.count; i++)
        {
            [_titlesWidthArr addObject:width];
        }
        
        self.titlesScrollView.contentSize = self.size;
        self.titlesScrollView.bounces = NO;
    }
}

- (CGSize)sizeOfString:(NSString *)text
             withWidth:(float)width
                  font:(UIFont *)font
{
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        size = [text boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:tdic
                                  context:nil].size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        size = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    }
    
    return size;
}
@end
