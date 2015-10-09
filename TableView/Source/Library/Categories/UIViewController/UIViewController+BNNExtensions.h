//
//  UIViewController+BNNExtensions.h
//  CourseUI
//
//  Created by Home on 10/8/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BNNExtensions)

+ (instancetype)controller;

// this method has to be overridden for custom NIB names, if invoked with nil name
// the method will attempt to load NIB with the same name as your controller's class
+ (NSString *)nibName;

@end
