//
//  CTStopCar1ViewController.m
//  LPExample
//
//  Created by 罗盼 on 2018/6/30.
//  Copyright © 2018年 咖达. All rights reserved.
//

#import "CTStopCar1ViewController.h"
#import "CTInputView.h"
#import "CTKeybordView.h"

@interface CTStopCar1ViewController ()
@property(nonatomic, strong) CTKeybordView *keybordView;
@end

@implementation CTStopCar1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CTInputView *inputView = [[CTInputView alloc]initWithFrame:CGRectMake(16, 158, [UIScreen mainScreen].bounds.size.width - 2*16, 44) count:7];
    [self.view addSubview:inputView];
    __weak typeof(self) weakself = self;
    __weak typeof(inputView) weakInputView = inputView;
    
    inputView.btnClickBlock = ^(NSInteger tag) {
        
        if (![weakself.keybordView isDescendantOfView:[UIApplication sharedApplication].keyWindow]) {
            weakself.keybordView = [[CTKeybordView alloc]init];
            [weakself.keybordView showInView:nil];
        }
        weakself.keybordView.type = tag ? CTKeybordViewLetter : CTKeybordViewSheng;
        weakself.keybordView.btnClickBlock = ^(NSString *currentBtnText) {
            [weakInputView clickKeybordText:currentBtnText tag:tag];
        };
        weakself.keybordView.deleteKeybordBlock = ^(NSString *text) {
            [weakInputView deleteKeybordWithTag:tag];
        };
        weakself.keybordView.onClickConfirmBlock = ^(NSString *text) {
            [weakInputView clearTempButtonLayer];
        };
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.keybordView dismiss];
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
