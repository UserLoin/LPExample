//
//  NSObject+SpExchange.h
//  Test
//
//  Created by 罗盼 on 2020/8/5.
//  Copyright © 2020 sp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SPExchange)
+ (void)sp_methodSwizzleWithOrigSel:(SEL)origSel
                          newSel:(SEL)newSel;
@end

NS_ASSUME_NONNULL_END
