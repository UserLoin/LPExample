//
//  ADView.h
//  9-04ADViewDemo
//
//  Created by XXX on 16/4/21.
//  Copyright © 2016年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ADView : UIView
//声明返回值为空，有一个参数的block
typedef void(^SendNameBlock)(NSString *name);

//传一个frame 和 装有图片名字的数组过来
//参数一：frame
//参数二：装有图片名字的数组
//参数三：BOOL如果是YES，那么自动滚动，如果是NO不滚动
-(id)initWithFrame:(CGRect)frame
 andImageNameArray:(NSMutableArray *)imageNameArray
      andIsRunning:(BOOL)isRunning;

//传一个frame 和 装有图片名字的数组过来
//参数一：frame
//参数二：装有图片名字的数组
//参数三：BOOL如果是YES，那么自动滚动，如果是NO不滚动
//参数四：带有回调传值的block
-(id)initWithFrame:(CGRect)frame
 andImageNameArray:(NSMutableArray *)imageNameArray
      andIsRunning:(BOOL)isRunning
          andBlock:(SendNameBlock)block;

//传一个frame 和 装有图片名字的数组过来
//参数一：frame
//参数二：装有图片名字的数组
//参数三：设置Scroll距离View两侧距离
//参数四：带有回调传值的block
//参数五：设置Scroll内部 图片间距
//参数六：带有回调传值的block
- (id)initWithFrame:(CGRect)frame
andDistanceForScroll:(float)distance
             andGap:(float)gap
  andImageNameArray:(NSMutableArray *)imageNameArray
       andIsRunning:(BOOL)isRunning
           andBlock:(SendNameBlock)block;
@end












