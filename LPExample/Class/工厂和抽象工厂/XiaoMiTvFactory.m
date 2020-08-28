//
//  XiaoTvFactory.m
//  Test
//
//  Created by 罗盼 on 2020/8/14.
//  Copyright © 2020 sp. All rights reserved.
//

#import "XiaoMiTvFactory.h"
#import "XiaoMi4ATv.h"
#import "XiaoMi5ATv.h"

@implementation XiaoMiTvFactory
+ (id)createPhone:(TvFactoryType)type {
    switch (type) {
        case TvType4A:
        {
            return [XiaoMi4ATv new];
        }
            break;
        case TvType5A:
        {
            return [XiaoMi5ATv new];
        }
            break;
        default:
            break;
    }
}
@end
