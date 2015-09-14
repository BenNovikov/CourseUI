//
//  BNNAppDelegate.m
//  CourseUI
//
//  Created by Admin on 15/09/11/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAppDelegate.h"
#import "BNNRectViewController.h"

@interface BNNAppDelegate ()

@end

@implementation BNNAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    BNNRectViewController *controller = [BNNRectViewController new];
    window.rootViewController = controller;
    
    controller.rectModel = [[BNNRectModel alloc] initWithPosition:BNNUpperLeftCorner];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
