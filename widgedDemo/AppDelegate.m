//
//  AppDelegate.m
//  widgedDemo
//
//  Created by 贾书唱的macbook on 2019/3/21.
//  Copyright © 2019年 jsc. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "EquipmentViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = nav;
    return YES;
}
// 所有版本的都可以使用
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    [self appCallbackWithOpenUrl:url];
    
    return YES;
}

/// iOS 8 以后
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    
    [self appCallbackWithOpenUrl:url];
    
    return YES;
}

/// iOS 7
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    [self appCallbackWithOpenUrl:url];
    
    return YES;
}

- (void)appCallbackWithOpenUrl:(NSURL *)url{
    // 针对url进行不同的操作
    NSLog(@"url====%@",url);
    NSLog(@"url.host===%@ url.scheme===%@",url.host,url.scheme);
    if([url.absoluteString hasPrefix:@"widgedDemo"]) {
        if([url.host isEqualToString:@"equipment"]) {
            //判断是否是直接跳入到具体页面
            UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
            EquipmentViewController *equipmentVC = [[EquipmentViewController alloc] init];
            [nav pushViewController:equipmentVC animated:YES];
        }
    }
    
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
