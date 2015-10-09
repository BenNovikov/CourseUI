//
//  UIViewController+BNNExtensions.m
//  CourseUI
//
//  Created by Home on 10/8/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UIViewController+BNNExtensions.h"

@implementation UIViewController (BNNExtensions)

#pragma mark -
#pragma mark Class methods

+ (instancetype)controller {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
