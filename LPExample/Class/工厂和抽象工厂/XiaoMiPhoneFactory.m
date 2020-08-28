//
//  XIaoMiPhoneFactory.m
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import "XiaoMiPhoneFactory.h"
#import "XiaoMiPhone.h"
#import "RedMiPhone.h"

@implementation XiaoMiPhoneFactory
+ (id)createPhone:(PhoneFactoryType)type {
    switch (type) {
        case PhoneTypeXiaoMi:
        {
            return [XiaoMiPhone new];
        }
            break;
        case PhoneTypeRedMi:
        {
            return [RedMiPhone new];
        }
            break;
        default:
            break;
    }
}
@end
