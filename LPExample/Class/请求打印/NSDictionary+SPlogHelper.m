//
//  NSDictionary+SPlogHelper.m
//  LPExample
//
//  Created by 罗盼 on 2020/8/6.
//  Copyright © 2020 咖达. All rights reserved.
//

#import "NSDictionary+SPlogHelper.h"


@implementation NSDictionary (SPlogHelper)

#if DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale{

    NSString *logString;
    @try {
        
    logString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];

    } @catch (NSException *exception) {
        
        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
        logString = [NSString stringWithFormat:@"转换失败:\n%@,\n转换终止,输出如下:\n%@",reason,self.description];
        
    } @finally {
 
    }
    return logString;
}
#endif

@end
