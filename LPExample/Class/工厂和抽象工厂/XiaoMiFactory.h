//
//  XiaoMiFactory.h
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,XiaoMiFactoryType) {
    XiaoMiTypePhone = 0,
    XiaoMiTypeTv,
};
NS_ASSUME_NONNULL_BEGIN

@interface XiaoMiFactory : NSObject
+ (Class)createFactory:(XiaoMiFactoryType)type;
@end

NS_ASSUME_NONNULL_END
