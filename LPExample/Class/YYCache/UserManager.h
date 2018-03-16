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
+ (instancetype)manager;

@property (nonatomic, strong) UserModel *userModel;

- (void)updateUserInfo:(id)userInfo;
- (void)updateValue:(id)value forKey:(NSString *)key;

@end
