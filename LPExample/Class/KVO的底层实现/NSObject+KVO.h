//
//  NSObject+KVO.h
//  LPExample
//
//  Created by 咖达 on 2017/9/3.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
- (void)lp_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
