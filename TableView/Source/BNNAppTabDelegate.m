//
//  BNNAppTabDelegate.m
//  TableView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAppTabDelegate.h"
#import "BNNDataModel.h"
#import "BNNReloadableDataArrayModel.h"
#import "BNNDataViewController.h"
#import "UIWindow+BNNExtensions.h"
#import "BNNConstants.h"

//static const NSUInteger kBNNDataArrayModelCount = 10;

@interface BNNAppTabDelegate ()
@property (nonatomic, strong) BNNReloadableDataArrayModel *model;

@end

@implementation BNNAppTabDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    BNNReloadableDataArrayModel *dataArray = [[BNNReloadableDataArrayModel alloc] init];
    self.model = dataArray;
    
    BNNDataViewController *controller = [BNNDataViewController new];
    controller.arrayModel = dataArray;
    
    self.window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.model save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //[self.model save];
}

@end
