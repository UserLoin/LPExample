//
//  SPUncaughtExceptionHandler.m
//  AvoidCrashDemo
//
//  Created by Simple_Code on 2018/9/4.
//  Copyright © 2018年 chenfanfang. All rights reserved.
//

#import "SPUncaughtExceptionHandler.h"
#import "AFNetworking.h"


// 沙盒的地址
NSString * applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// 崩溃时的回调函数
void UncaughtExceptionHandler(NSException * exception) {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason]; // // 崩溃的原因  可以有崩溃的原因(数组越界,字典nil,调用未知方法...) 崩溃的控制器以及方法
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    // 将一个txt文件写入沙盒
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@implementation SPUncaughtExceptionHandler
+ (instancetype)shareInstance {
    static SPUncaughtExceptionHandler *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SPUncaughtExceptionHandler alloc]init];
    });
    return instance;
}
- (void)setDefaultHandler {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    [self collectionExceptionMessage];
}
// 获取崩溃统计的函数指针
- (NSUncaughtExceptionHandler *)getHandler {
    return NSGetUncaughtExceptionHandler();
}
- (void)takeException:(NSException *)exception {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}
- (void)collectionExceptionMessage {
    // 发送崩溃日志
    NSString *dataPath = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    if (data != nil) {
        [self sendExceptionLogWithData:data path:dataPath];
    }
}

#pragma mark -- 发送崩溃日志
- (void)sendExceptionLogWithData:(NSData *)data path:(NSString *)path {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 5.0f;
    //告诉AFN，支持接受 text/xml 的数据
    [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    NSString *urlString = @"后台地址";
    [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"Exception.txt" mimeType:@"txt"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 删除文件
        NSFileManager *fileManger = [NSFileManager defaultManager];
        [fileManger removeItemAtPath:path error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 发送Bug失败
    }];
}
@end
