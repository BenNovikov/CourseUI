//
//  BNNAppTabDelegate.m
//  TableView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAppTabDelegate.h"
#import "BNNDataModel.h"
#import "BNNDataArrayModel.h"
#import "BNNDataViewController.h"
#import "UIWindow+BNNExtensions.h"
#import "BNNConstants.h"

static const NSUInteger kBNNDataArrayModelCount = 10;

@interface BNNAppTabDelegate ()
@property (nonatomic, strong) BNNDataArrayModel *model;

@end

@implementation BNNAppTabDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    BNNDataArrayModel *dataArray = [BNNDataArrayModel dataWithModelsCount:kBNNDataArrayModelCount];
    self.model = dataArray;
    
    BNNDataViewController *controller = [BNNDataViewController new];
    controller.arrayModel = dataArray;
    self.window.rootViewController = controller;
    
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
