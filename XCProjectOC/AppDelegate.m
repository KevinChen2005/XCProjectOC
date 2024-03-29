//
//  AppDelegate.m
//  XCProjectOC
//
//  Created by xiaochen on 2018/3/19.
//  Copyright © 2018年 xiaochen. All rights reserved.
//

#import "AppDelegate.h"
#import "XCHomeViewController.h"
#import "XCLocalPush.h"

// Analytics
#import <Firebase.h>
#import <UMMobClick/MobClick.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // UMeng
//    UMConfigInstance.channelId = @"App Store";
//    UMConfigInstance.appKey = @"";
//    UMConfigInstance.ePolicy = SEND_INTERVAL;
//    //        [MobClick setLogEnabled:YES]; // 调试模式
//    [MobClick startWithConfigure:UMConfigInstance];
//
//    // Facebook
//    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
//
//    // Firebase
//    [FIRApp configure];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = [[XCHomeViewController alloc] init];
    [_window makeKeyAndVisible];
    
    [XCLocalPush removeLocalNotification];
    [XCLocalPush registerLocalNotification];
    [XCLocalPush sendLocalNotification];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge -= notification.applicationIconBadgeNumber;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}

@end
