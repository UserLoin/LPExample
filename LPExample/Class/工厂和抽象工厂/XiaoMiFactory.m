//
//  XiaoMiFactory.m
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import "XiaoMiFactory.h"
#import "XiaoMiPhoneFactory.h"
#import "XiaoMiTvFactory.h"

@implementation XiaoMiFactory
+ (Class)createFactory:(XiaoMiFactoryType)type {
    switch (type) {
        case XiaoMiTypePhone:
        {
            return [XiaoMiPhoneFactory class];
        }
            break;
        case XiaoMiTypeTv:
        {
            return [XiaoMiTvFactory class];
        }
            break;
        default:
            break;
    };
}

@end
