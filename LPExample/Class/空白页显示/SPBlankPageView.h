//
//  SPBlankPageView.h
//  LPExample
//
//  Created by 123456789 on 2018/3/13.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SPBlankPageViewType){
    SPBlankPageViewTypeHasData = 0,
    SPBlankPageViewTypeHasError,
    SPBlankPageViewTypeNoData,
};

@interface SPBlankPageView : UIView
- (void)configWithType:(SPBlankPageViewType)blankPageType
     reloadButtonBlock:(void(^)(UIButton *sender))block;
@end

@interface UIView (SPConfigBlank)
- (void)addBlankPageViewWithType:(SPBlankPageViewType)blankPageType
               reloadButtonBlock:(void(^)(id sender))block;
@end
