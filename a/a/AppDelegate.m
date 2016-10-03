//
//  AppDelegate.m
//  a
//
//  Created by 谭 卓勋 on 16/8/16.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "KCTabBarViewController.h"
#import "header.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    KCTabBarViewController *tabBarController=[[KCTabBarViewController alloc]init];
    
    FirstViewController *firstViewController=[[FirstViewController alloc]init];
    SecondViewController *secondViewController=[[SecondViewController alloc]init];
    tabBarController.viewControllers=@[firstViewController,secondViewController];
    //注意默认情况下UITabBarController在加载子视图时是懒加载的，所以这里调用一次contactController，否则在第一次展示时只有第一个控制器tab图标，contactController的tab图标不会显示
    _window.rootViewController=tabBarController;
    [_window makeKeyAndVisible];

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    //2保存数据(如果设置数据之后没有同步, 会在将来某一时间点自动将数据保存到Preferences文件夹下面)
    [defaults setObject:@"favoriteCaption" forKey:@"ensign"];
    
    //3.强制让数据立刻保存
    
    NSDictionary *dict = @{ IsWarp:@YES};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dict];

    
    
    [defaults synchronize];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
