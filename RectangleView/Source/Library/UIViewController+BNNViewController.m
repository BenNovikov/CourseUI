//
//  BNNRectViewController+UIViewController_BNNViewController.m
//  CourseUI
//
//  Created by Admin on 15/09/16/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UIViewController+BNNViewController.h"

@implementation UIViewController (BNNViewController)

#pragma mark -
#pragma mark Class methods

+ (instancetype)controller {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}


@end
