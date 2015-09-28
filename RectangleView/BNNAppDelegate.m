//
//  BNNAppDelegate.m
//  CourseUI
//
//  Created by Admin on 15/09/11/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAppDelegate.h"
#import "BNNRectViewController.h"
#import "UIViewController+BNNViewController.h"

@implementation BNNAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    BNNRectViewController *controller = [BNNRectViewController controller];
    window.rootViewController = controller;
    
    controller.rectModel = [[BNNRectModel alloc] initWithPosition:BNNTopLeftCorner];
    [window makeKeyAndVisible];
    
    return YES;
}

@end
