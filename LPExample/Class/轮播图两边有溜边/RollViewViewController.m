//
//  RollViewViewController.m
//  LPExample
//
//  Created by Simple_Code on 2018/6/5.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "RollViewViewController.h"
#import "RollView.h"

@interface RollViewViewController ()<RollViewDelegate>
@property (nonatomic, strong) RollView *rollView;
@end


@implementation RollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatPicRollView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

}
-(void)creatPicRollView{
    
    
    
    self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150) withDistanceForScroll:20.0f withGap:8.0f];
    
    /** 全屏宽滑动 视图之间间隙,  将 Distance 设置为 -12.0f */
    // self.rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 150) withDistanceForScroll: -12.0f withGap:8.0f];
    // self.rollView.backgroundColor = [UIColor blackColor];
    
    self.rollView.delegate = self;
    
    [self.view addSubview:self.rollView];
    
    
    NSArray *arr = @[@"11.jpg",
                     @"22.jpg",
                     @"33.jpg"];
    
    [self.rollView rollView:arr];
}

#pragma mark - 滚动视图协议
-(void)didSelectPicWithIndexPath:(NSInteger)index{
    
    if (index != -1) {
        
        NSLog(@"%ld", (long)index);
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
