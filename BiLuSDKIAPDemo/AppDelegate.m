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

      [BiLuSDKManager registerViewWithAppID:@"9e54034e4f52b5f5" appKey:@"982b333bf41d2787ea19e308485e221c" configuration:nil block:^(BiLuPlayer * _Nonnull player, NSError * _Nonnull error) {

        NSString *log =   [NSString stringWithFormat:@"%@昵称：\nID：%@\n\n回调：%@",player.alias,player.playerID,player.registerCode];
          NSLog(@"%@", log);

    }];




    return YES;
}




@end
