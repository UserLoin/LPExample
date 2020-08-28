//
//  AppDelegate.m
//  LPExample
//
//  Created by 咖达 on 2017/8/1.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "AppDelegate.h"
#import "MianViewController.h"
#import "GVUserDefaults+SPProperties.h"
#import "SPUncaughtExceptionHandler.h"

#if defined(DEBUG) || defined(_DEBUG)
#import "FHHFPSIndicator.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    [self.window makeKeyAndVisible];

    
    // add the follwing code after the window become keyAndVisible
#if defined(DEBUG) || defined(_DEBUG)
    [[FHHFPSIndicator sharedFPSIndicator] show];
    [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
#endif
    
    
    // GVUserDefault使用实例
    if (SPUserDefault.isNoFirstLaunch)
    {
        // NSLog(@"我是第一次登陆");
    }
    SPUserDefault.isNoFirstLaunch=YES;
    
    
    UINavigationController *naVc = [[UINavigationController alloc]initWithRootViewController:[[MianViewController alloc]init]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = naVc;
    
    //[UncaughtExceptionManager setDefaultHandler];

    return YES;
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
