//
//  ExampleModel.h
//  LPExample
//
//  Created by 咖达 on 2017/8/1.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExampleModel : NSObject
@property (copy, nonatomic) NSString *header;
@property (strong, nonatomic) NSArray *titlesArray;
@property (strong, nonatomic) NSArray *methodsArray;
@property (strong, nonatomic) NSArray <Class>*vcClassArray;
@end
