//
//  ManyRequestViewController.m
//  LPExample
//
//  Created by 罗盼 on 2018/7/21.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "ManyRequestViewController.h"
#import "SPRequest.h"
#import "ReactiveCocoa.h"

static NSString *url = @"https://api.douban.com/v2/book/1220562";

@interface ManyRequestViewController ()

@end

@implementation ManyRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self request2];

}
- (void)request1 {
    
    // 不需要对每一次请求结果进行处理、只需知道什么视乎请求完成
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < 3; i++) {
        dispatch_group_enter(group);
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //请求3
            [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
                dispatch_group_leave(group);
                NSLog(@"请求-Success");
            } failure:^(SPRequest *request, NSError *error) {
                dispatch_group_leave(group);
                NSLog(@"请求-Fail");
                
            }];
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //界面刷新
        NSLog(@"所有请求完成，进行下一步操作");
    });
}

- (void)request2 {
    
    // 需要对每一次请求结果进行处理、每个请求完成或者失败后，处理参数
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求1
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_group_leave(group);
            NSLog(@"请求1-Success");
            // 对请求1responseObject进行处理
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_group_leave(group);
            NSLog(@"请求1-Fail");
            // 对请求1error进行处理
        }];
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求2
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_group_leave(group);
            NSLog(@"请求2-Success");
            // 对请求2responseObject进行处理
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_group_leave(group);
            NSLog(@"请求2-Fail");
            // 对请求2error进行处理
        }];
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求3
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_group_leave(group);
            NSLog(@"请求3-Success");
            // 对请求3responseObject进行处理
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_group_leave(group);
            NSLog(@"请求3-Fail");
            // 对请求3error进行处理
        }];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //界面刷新
        NSLog(@"所有请求完成，进行下一步操作");
    });
}


- (void)request3 {
    
    // 请求1
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求1-Success");
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求1-Fail");
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }];
    
    // 请求2
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求2-Success");
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求2-Fail");
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }];
    
    // 请求3
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求3-Success");
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_semaphore_signal(sema);
            NSLog(@"请求3-Fail");
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }];
    
    // 4.设置依赖
    [operation2 addDependency:operation1];      //请求2依赖请求1
    [operation3 addDependency:operation2];      //请求3依赖请求2
    
    // 5.创建队列并加入任务
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:@[operation3, operation2, operation1] waitUntilFinished:NO];
    
}
- (void)request4 {
    // 创建一个信号管1
    RACSignal *siganl1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            [subscriber sendNext:@"请求1结果"];
            [subscriber sendCompleted];
            NSLog(@"请求1-Success");
        } failure:^(SPRequest *request, NSError *error) {
            [subscriber sendCompleted];
            NSLog(@"请求1-Fail");
        }];
        return [RACDisposable disposableWithBlock:^{}];
        
    }];
    
    // 创建一个信号管2
    RACSignal *siganl2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            [subscriber sendNext:@"请求2结果"];
            [subscriber sendCompleted];
            NSLog(@"请求2-Success");
        } failure:^(SPRequest *request, NSError *error) {
            [subscriber sendCompleted];
            NSLog(@"请求2-Fail");
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    
    // 创建一个信号管3
    RACSignal *siganl3 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            [subscriber sendNext:@"请求3结果"];
            [subscriber sendCompleted];
            NSLog(@"请求3-Success");
        } failure:^(SPRequest *request, NSError *error) {
            [subscriber sendCompleted];
            NSLog(@"请求3-Fail");
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    
    // 串联管1管2管3
    RACSignal *concatSiganl = [[siganl1 concat:siganl2] concat:siganl3];
    //串联后的接收端处理 ,两个事件,走两次,第一个打印siggnal1的结果,第二次打印siganl2的结果
    [concatSiganl subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}
- (void)request5 {
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    for (int i = 0; i < 3; i++) {
        [[SPRequest request] GET:url parameters:nil success:^(SPRequest *request, NSString *responseString) {
            dispatch_semaphore_signal(sem);
            if (i == 3) {
                dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
            }
            NSLog(@"请求%@-Success",@(i));
        } failure:^(SPRequest *request, NSError *error) {
            dispatch_semaphore_signal(sem);
            NSLog(@"请求%@-Fail",@(i));
            if (i == 3) {
                dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
            }
        }];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"end");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
