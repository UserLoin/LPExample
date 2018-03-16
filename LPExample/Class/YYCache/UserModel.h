//
//  UserModel.h
//  Cache
//
//  Created by 罗盼 on 2017/11/6.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface UserModel : NSObject
// 用户信息
@property (nonatomic, copy, readonly) NSString *name;//姓名
@property (nonatomic, copy, readonly) NSString *gender;//性别
@property (nonatomic, copy, readonly) NSString *age;//年龄
@property (nonatomic, copy, readonly) NSString *height;//身高

@end
