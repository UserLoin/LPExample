//
//  YYCacheViewController.m
//  LPExample
//
//  Created by 罗盼 on 2017/11/10.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "YYCacheViewController.h"
#import "UserManager.h"
#import "AccountModel.h"
#import "YYCache.h"

#define UserModel [UserManager manager].userModel
#define UserInfoManager [UserManager manager]


@interface YYCacheViewController ()

@end

@implementation YYCacheViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"######%@",@"存储地址");
    NSLog(@"%@",NSHomeDirectory());
    
    NSLog(@"%@",@"已经存储的信息");
    NSLog(@"%@",UserModel.name);
    NSLog(@"%@",UserModel.gender);
    NSLog(@"%@",UserModel.age);
    
    NSDictionary *userInfo = @{@"name":@"张三",
                               @"gender":@"男",
                               @"age":@"18"};
    
    [UserInfoManager updateUserInfo:userInfo];
    
    NSLog(@"######%@",@"存储新的信息");
    NSLog(@"%@",UserModel.name);
    NSLog(@"%@",UserModel.gender);
    NSLog(@"%@",UserModel.age);
    
    NSLog(@"######%@",@"更新信息");
    [UserInfoManager updateValue:@"改变为张四" forKey:@"name"];
    [UserInfoManager updateValue:@"改变为30" forKey:@"age"];
    [UserInfoManager updateValue:@"改变为男" forKey:@"gender"];
    [UserInfoManager updateValue:@"新添加的身高为170" forKey:@"height"];

    NSLog(@"%@",UserModel.name);
    NSLog(@"%@",UserModel.gender);
    NSLog(@"%@",UserModel.age);
    NSLog(@"%@",UserModel.height);
    
    NSLog(@"%@",UserModel.height);
    
    
    YYCache *dataCache = [[YYCache alloc] initWithName:@"ArticleCache"];
    
    AccountModel *cacheModel = [AccountModel shareInstace];
    cacheModel.articleID = 100;
    cacheModel.articleTitle = @"文章标题";
    cacheModel.imageUrl = @"图片地址";
    cacheModel.authorName = @"作者名字";
    //存储到本地
    [dataCache setObject: cacheModel forKey:@"cacheModelKey"];
}
@end
