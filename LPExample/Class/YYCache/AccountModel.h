//
//  AccountModel.h
//  LPExample
//
//  Created by Simple_Code on 2018/7/26.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountModel : NSObject
+ (instancetype)shareInstace;
@property(nonatomic, copy)NSString *articleTitle;
@property(nonatomic, copy)NSString *imageUrl;
@property(nonatomic, copy)NSString *authorName;
@property(nonatomic, assign)NSInteger articleID;
@end
