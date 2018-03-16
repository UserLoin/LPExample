//
//  UserModel.h
//  Cache
//
//  Created by 罗盼 on 2017/11/6.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *gender;
@property (nonatomic, copy, readonly) NSString *age;
@end
