//
//  XIaoMiPhoneFactory.h
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PhoneFactoryType) {
    PhoneTypeXiaoMi = 0,
    PhoneTypeRedMi,
};


NS_ASSUME_NONNULL_BEGIN

@interface XiaoMiPhoneFactory : NSObject
+ (id)createPhone:(PhoneFactoryType)type;
@end

NS_ASSUME_NONNULL_END
