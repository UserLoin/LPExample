//
//  AccountModel.m
//  LPExample
//
//  Created by Simple_Code on 2018/7/26.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel

+ (instancetype)shareInstace {
    static AccountModel *shareInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstace = [[AccountModel alloc] init];
    });
    return shareInstace;
}

// 归档（序列化）
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.articleID forKey:@"articleID"];
    [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.articleTitle forKey:@"articleTitle"];
    [aCoder encodeObject:self.imageUrl forKey:@"imageUrl"];
}

// 反归档（反序列化）
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.articleID = [aDecoder decodeIntForKey:@"articleID"];
    self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
    self.articleTitle = [aDecoder decodeObjectForKey:@"articleTitle"];
    self.imageUrl = [aDecoder decodeObjectForKey:@"imageUrl"];
    
    return self;
}

@end
