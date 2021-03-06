//
//  AppDelegate.m
//  FinancialManager
//
//  Created by lostkid on 13-3-12.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"

#import "LoginViewController.h"

#import "EnterPasswordViewController.h"

#import "Authority.h"
#import "DBConnection.h"


#define LoginOutTime 10

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //第一次登陆未授权
    [Authority LoginOut];
    
    //初始化数据库
    [DBConnection createEditableCopyOfDatabaseIfNeeded:NO];
    [DBConnection getSharedDatabase];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self getLoginVC];
    [self.window makeKeyAndVisible];
    return YES;
}

//获得主控制器
- (void)getMainVC{

    MainViewController *mainVC = [[MainViewController alloc] init];
    [self.window setRootViewController:mainVC];

}

//获得登陆界面
- (void)getLoginVC{

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *navLogin = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self.window setRootViewController:navLogin];
    
}

//获得输入密码
- (void)getEnterPasswordVC{
    
    EnterPasswordViewController *passwordVC = [[EnterPasswordViewController alloc] init];
    [self.window setRootViewController:passwordVC];

}

//获得appdelegate
+(id)getAppdelegate{

    return [UIApplication sharedApplication].delegate;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//N秒后退出登陆
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //Perform your tasks that your application requires
        
        [NSThread sleepForTimeInterval:LoginOutTime];
        NSLog(@"%ds after",LoginOutTime);
        [self getEnterPasswordVC];
        
    });

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
