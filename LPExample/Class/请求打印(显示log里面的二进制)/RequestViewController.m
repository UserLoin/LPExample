//
//  RequestViewController.m
//  Test
//
//  Created by 罗盼 on 2020/8/6.
//  Copyright © 2020 sp. All rights reserved.
//

#import "RequestViewController.h"
#import "MBProgressHUD.h"
#import "SPRequest.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Two";
    
    
    SPRequest *request = [SPRequest request];
    [request GET:@"http://www.weather.com.cn/data/sk/101010100.html" parameters:nil success:^(SPRequest *request, NSString *responseString) {
        
    } failure:^(SPRequest *request, NSError *error) {
        
    }];
    [request cancelAllOperations];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
