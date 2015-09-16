//
//  UIViewController+BNNViewController.h
//  CourseUI
//
//  Created by Admin on 15/09/16/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BNNViewController)

+ (instancetype)controller;

/* this method has to be overridden for custom NIB names, if invoked with nil name the method will attempt to load NIB with the same name as your controller's class */
+ (NSString *)nibName;

@end
