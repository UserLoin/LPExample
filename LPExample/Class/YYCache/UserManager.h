//
//  UserManager.h
//  Cache
//
//  Created by 罗盼 on 2017/11/6.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

// 单利
+ (instancetype)manager;
// 用户信息
@property (nonatomic, strong) UserModel *userModel;
// 存储用户字典数据
- (void)updateUserInfo:(id)userInfo;
// 更改用户属性值
- (void)updateValue:(id)value forKey:(NSString *)key;

@end
