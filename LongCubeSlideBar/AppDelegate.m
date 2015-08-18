//
//  AppDelegate.m
//  LongCubeSlideBar
//
//  Created by zhou dengfeng derek on 18/8/15.
//  Copyright (c) 2015 Creative Fountain. All rights reserved.
//

#import "AppDelegate.h"
#import "LongCubeSlideBarMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    LongCubeSlideBarMainViewController *mainVC = [[LongCubeSlideBarMainViewController alloc] init];
    self.window.rootViewController = mainVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
