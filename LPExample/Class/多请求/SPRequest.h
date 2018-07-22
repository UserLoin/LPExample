//
//  SPRequest.h
//  LPExample
//
//  Created by 罗盼 on 2018/7/22.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

@class SPRequest;
@protocol SPRequestDelegate <NSObject>

- (void)SPRequest:(SPRequest *)request finished:(NSDictionary *)response;
- (void)SPRequest:(SPRequest *)request Error:(NSError *)error;

@end

@interface SPRequest : NSObject

@property (assign) id <SPRequestDelegate> delegate;

/**
 *[AFNetWorking]的operationManager对象
 */
@property (nonatomic, strong) AFHTTPSessionManager* operationManager;

/**
 *当前的请求operation队列
 */
@property (nonatomic, strong) NSOperationQueue* operationQueue;

/**
 *功能: 创建SPRequest的对象方法
 */
+ (instancetype)request;

/**
 *功能：GET请求
 *参数：(1)请求的url: urlString
 *     (2)请求成功调用的Block: success
 *     (3)请求失败调用的Block: failure
 */
- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
    success:(void (^)(SPRequest *request, NSDictionary *responseObject))success
    failure:(void (^)(SPRequest *request, NSError *error))failure;

/**
 *功能：POST请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 *     (3)请求成功调用的Block: success
 *     (4)请求失败调用的Block: failure
 */
- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(SPRequest *request, NSDictionary *responseObject))success
     failure:(void (^)(SPRequest *request, NSError *error))failure;

/**
 *  post请求
 *
 *  @param URLString  请求网址
 *  @param parameters 请求参数
 */
- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  get 请求
 *
 *  @param URLString 请求网址
 */
- (void)getWithURL:(NSString *)URLString;

/**
 *取消当前请求队列的所有请求
 */
- (void)cancelAllOperations;

@end
