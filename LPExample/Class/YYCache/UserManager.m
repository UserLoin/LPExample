//
//  UserManager.m
//  Cache
//
//  Created by 罗盼 on 2017/11/6.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "UserManager.h"
#import "YYCache.h"
#import "UserModel.h"
#import "MJExtension.h"

@interface UserManager()
@property(nonatomic,strong) YYCache *userCache; //YYCache对象
@property(nonatomic,strong) NSMutableDictionary *userInfoDict; //用户信息字典
@end

@implementation UserManager

#pragma mark - 假懒加载
- (NSMutableDictionary *)userInfoDict {
    if (!_userInfoDict) {
        id value = [self.userCache objectForKey:@"userInfo"];
        NSMutableDictionary *userInfoDict = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)value];
        return userInfoDict;
    }
    return _userInfoDict;
}

- (UserModel *)userModel {
    if (!_userModel) {
        if (self.userInfoDict) {
            UserModel *employeeModel = [UserModel mj_objectWithKeyValues:self.userInfoDict];
            return employeeModel;
        }
    }
    return _userModel;
}

#pragma mark - 单利 - 创建管理对象
+ (instancetype)manager {
    static UserManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[UserManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userCache = [[YYCache alloc] initWithName:@"app.userInfo"];
    }
    return self;
}

#pragma mark - 存储用户字典数据
- (void)updateUserInfo:(id)userInfo {
    [self.userCache setObject:userInfo forKey:@"userInfo"];
}

#pragma mark - 更改用户属性值
- (void)updateValue:(id)value forKey:(NSString *)key{
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:self.userInfoDict];
    [tempDic setValue:value forKey:key];
    [self updateUserInfo:tempDic];
}

@end
