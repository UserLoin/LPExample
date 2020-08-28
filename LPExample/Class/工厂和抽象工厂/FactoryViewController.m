//
//  FactoryViewController.m
//  LPExample
//
//  Created by 罗盼 on 2020/8/17.
//  Copyright © 2020 咖达. All rights reserved.
//

#import "FactoryViewController.h"
#import "XiaoMiPhoneFactory.h"
#import "XiaoMiPhone.h"
#import "RedMiPhone.h"
#import "XiaoMiTvFactory.h"
#import "XiaoMi4ATv.h"
#import "XiaoMi5ATv.h"
#import "XiaoMiFactory.h"

@interface FactoryViewController ()

@end

@implementation FactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    XiaoMiPhone *xPhone = [XiaoMiPhoneFactory createPhone:PhoneTypeXiaoMi];
    RedMiPhone *rPhone = [XiaoMiPhoneFactory createPhone:PhoneTypeRedMi];
    [xPhone create];
    [rPhone create];

   
    XiaoMi4ATv *Tv4 = [XiaoMiTvFactory createPhone:TvType4A];
    XiaoMi5ATv *Tv5 = [XiaoMiTvFactory createPhone:TvType5A];
    [Tv4 create];
    [Tv5 create];
   
    Class cl1 = [XiaoMiFactory createFactory:XiaoMiTypePhone];
    if ([NSStringFromClass(cl1) isEqualToString:@"XiaoMiPhoneFactory"]) {
        [[XiaoMiPhoneFactory createPhone:PhoneTypeXiaoMi] create];
    }
   
   
    Class cl2 = [XiaoMiFactory createFactory:XiaoMiTypeTv];
    if ([NSStringFromClass(cl2) isEqualToString:@"XiaoMiTvFactory"]) {
        [[XiaoMiTvFactory createPhone:TvType4A] create];
    }
}

@end
