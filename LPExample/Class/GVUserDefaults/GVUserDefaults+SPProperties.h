//
//  GVUserDefaults+SPProperties.h
//  LPExample
//
//  Created by 123456789 on 2018/3/12.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "GVUserDefaults.h"
#define SPUserDefault [GVUserDefaults standardUserDefaults]

@interface GVUserDefaults (SPProperties)

#pragma mark -- personinfo
@property (nonatomic,weak) NSString *userName;
@property (nonatomic,weak) NSString *name;
@property (nonatomic,weak) NSString *role;

#pragma mark --是否是第一次启动APP程序
@property (nonatomic,assign) BOOL isNoFirstLaunch;

@end
