//
//  AppDelegate.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/9.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    
    OneViewController *oneViewController=[[OneViewController alloc]init];
    TwoViewController *towViewController=[[TwoViewController alloc]init];
    ThreeViewController *threeViewController=[[ThreeViewController alloc]init];
    FourViewController *fourViewController=[[FourViewController alloc]init];
    FiveViewController *fiveViewController=[[FiveViewController alloc]init];

    oneViewController.tabBarItem.title=@"首页";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    oneViewController.tabBarItem.image=[UIImage imageNamed:@"1"];//默认图片
    towViewController.tabBarItem.title=@"社区";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    towViewController.tabBarItem.image=[UIImage imageNamed:@"2"];//默认图片
    threeViewController.tabBarItem.title=@"";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    threeViewController.tabBarItem.image=[UIImage imageNamed:@"3"];//默认图片
    fourViewController.tabBarItem.title=@"购物车";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    fourViewController.tabBarItem.image=[UIImage imageNamed:@"4"];//默认图片
    fiveViewController.tabBarItem.title=@"首页";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    fiveViewController.tabBarItem.image=[UIImage imageNamed:@"1"];//默认图片
    
    oneViewController.view.backgroundColor=[UIColor whiteColor];
    towViewController.view.backgroundColor=[UIColor whiteColor];
    threeViewController.view.backgroundColor=[UIColor whiteColor];
    fourViewController.view.backgroundColor=[UIColor whiteColor];
    fiveViewController.view.backgroundColor=[UIColor whiteColor];
    
    UINavigationController *navOne = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    
        
    [tabBarController addChildViewController:navOne];
    
    UINavigationController *navTwo=[[UINavigationController alloc]initWithRootViewController:towViewController];
    [tabBarController addChildViewController:navTwo];
    
    UINavigationController *navThree=[[UINavigationController alloc]initWithRootViewController:threeViewController];
    [tabBarController addChildViewController:navThree];

    UINavigationController *navFour=[[UINavigationController alloc]initWithRootViewController:fourViewController];
    [tabBarController addChildViewController:navFour];
    
    UINavigationController *navFive=[[UINavigationController alloc]initWithRootViewController:fiveViewController];
    [tabBarController addChildViewController:navFive];
    
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    tabBarController.tabBar.selectedImageTintColor = [UIColor redColor];
    
    navOne.navigationBar.barTintColor=[UIColor redColor];
    
    
    navTwo.navigationBar.barTintColor=[UIColor redColor];
    
    navThree.navigationBar.barTintColor=[UIColor redColor];
    
    
    navFour.navigationBar.barTintColor=[UIColor redColor];
    
    navFive.navigationBar.barTintColor=[UIColor redColor];
    
    //注意默认情况下UITabBarController在加载子视图时是懒加载的，所以这里调用一次contactController，否则在第一次展示时只有第一个控制器tab图标，contactController的tab图标不会显示
    self.window.rootViewController=tabBarController;
    [self.window makeKeyAndVisible];
    

    
    
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
