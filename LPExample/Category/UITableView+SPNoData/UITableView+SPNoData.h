//
//  UITableView+SPNoData.h
//  Test_OC
//
//  Created by 罗盼 on 2020/2/13.
//  Copyright © 2020 lp. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 消除警告
 */
@protocol SPTableViewDelegate <NSObject>
@optional
- (UIView   *)sp_noDataView;                //  完全自定义占位图
- (UIImage  *)sp_noDataViewImage;           //  使用默认占位图, 提供一张图片,    可不提供, 默认不显示
- (NSString *)sp_noDataViewMessage;         //  使用默认占位图, 提供显示文字,    可不提供, 默认为暂无数据
- (UIColor  *)sp_noDataViewMessageColor;    //  使用默认占位图, 提供显示文字颜色, 可不提供, 默认为灰色
- (NSNumber *)sp_noDataViewCenterYOffset;   //  使用默认占位图, CenterY 向下的偏移量
- (NSNumber *)sp_noDataViewCenterXOffset;   //  使用默认占位图, CenterX 向下的偏移量
@end

@interface UITableView (SPNoData)

@end

NS_ASSUME_NONNULL_END
