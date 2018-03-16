//
//  AdaptTableViewController.m
//  LPExample
//
//  Created by 罗盼 on 2017/11/27.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "AdaptTableViewController.h"
#import "EmptyDataViewController.h"

@interface AdaptTableViewController ()<UITableViewDataSource>

@end

@implementation AdaptTableViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 1. 默认情况(导航栏透明，cell自适应:空出导航栏位置开始布局)
    // tableView(0,0) cell(0,64)
    
    // 2. 情况一(导航栏透明，cell禁止自适应：从UITaleView顶端开始布局)
    //self.automaticallyAdjustsScrollViewInsets = NO; (默认为YES下滑64)
    // tableView(0,0) cell(0,0)
    
    // 3. 情况三(cell禁止自适应,导航栏不透明，空出导航栏位置开始布局)
    //self.navigationController.navigationBar.translucent = NO;
    //self.extendedLayoutIncludesOpaqueBars = NO;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    // tableView(0,64) cell(0,0)
    
    // 4. 情况四(cell禁止自适应,导航栏不透明,从UITaleView顶端开始布局)
    //self.navigationController.navigationBar.translucent = NO;
    //self.extendedLayoutIncludesOpaqueBars = YES;
    //self.automaticallyAdjustsScrollViewInsets =  NO;
    // tableView(0,0) cell(0,0)

    // 5. 情况五(导航栏透明，cell禁止自适应，extendedLayoutIncludesOpaqueBars的设置是无效的)
    //self.navigationController.navigationBar.translucent = YES;
    //self.extendedLayoutIncludesOpaqueBars = YES;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    // extendedLayoutIncludesOpaqueBars
    // 延伸视图包含不包含不透明的Bar,是用来指定导航栏是透明的还是不透明,IOS7中默认是YES
    
    NSInteger typeNumber = 6;
    
    switch (typeNumber) {
        case 1:
        {
            //默认
            self.navigationController.navigationBar.translucent = YES;
            self.automaticallyAdjustsScrollViewInsets = YES;
            
            // tableView(0,0),cell(0,64)  navigationBar透明
        }
            break;
        case 2:
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
            // tableView(0,0),cell(0,0)  navigationBar透明
        }
            break;
        case 3:
        {
            self.navigationController.navigationBar.translucent = NO;
            self.extendedLayoutIncludesOpaqueBars = NO;
            self.automaticallyAdjustsScrollViewInsets = NO;
            // tableView(0,64),cell(0,0)  navigationBar不透明
        }
            break;
        case 4:
        {
            self.navigationController.navigationBar.translucent = NO;
            self.extendedLayoutIncludesOpaqueBars = YES;
            self.automaticallyAdjustsScrollViewInsets =  NO;
            // tableView(0,0),cell(0,0)  navigationBar不透明

        }
            break;
        case 5:
        {
            self.navigationController.navigationBar.translucent = YES;
            self.extendedLayoutIncludesOpaqueBars = YES;
            self.automaticallyAdjustsScrollViewInsets = NO;
            // tableView(0,0),cell(0,0)  navigationBar透明

        }
            break;
        case 6:
        {
            self.navigationController.navigationBar.translucent = NO;
            //(设置为NO则automaticallyAdjustsScrollViewInsets失效)
            
            //self.extendedLayoutIncludesOpaqueBars = YES;
            self.automaticallyAdjustsScrollViewInsets = YES;
            // tableView(0,0),cell(0,0)  navigationBar透明
            
        }
            break;
            
        default:
            break;
    }
    
    // 创建tableView
    UITableView * tableVeiw = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    tableVeiw.backgroundColor = [UIColor redColor];
    tableVeiw.dataSource = self;
    tableVeiw.rowHeight = 80;
    [self.view addSubview:tableVeiw];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"Identifider";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.text = @"测试页面";
    
    return cell;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EmptyDataViewController *vc = [[EmptyDataViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
