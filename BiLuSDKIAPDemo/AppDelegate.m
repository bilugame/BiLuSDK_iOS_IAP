//
//  AppDelegate.m
//  BiLuSDKIAPDemo
//
//  Created by 李加建 on 2019/11/14.
//  Copyright © 2019 mobile. All rights reserved.
//

#import "AppDelegate.h"

#import <BiLuSDKIAP/BiLuSDKIAP.h>

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController = [[ViewController alloc]init];

    [self.window makeKeyAndVisible];
    NSLog(@"%@",BiLuSDKManager.SDKVersion);

    [BiLuSDKManager registerViewWithAppID:@"66c7c15dacf008d8" appKey:@"7794001eb60d202c705e0dd3dda6b819" configuration:nil block:^(BiLuPlayer * _Nonnull player, NSError * _Nonnull error) {



    }];




    return YES;
}




@end
