//
//  XiaoTvFactory.h
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,TvFactoryType) {
    TvType4A = 0,
    TvType5A,
};
NS_ASSUME_NONNULL_BEGIN

@interface XiaoMiTvFactory : NSObject
+ (id)createPhone:(TvFactoryType)type;
@end

NS_ASSUME_NONNULL_END
