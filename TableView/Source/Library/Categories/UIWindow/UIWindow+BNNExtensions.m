//
//  UIWindow+BNNExtensions.m
//  CourseUI
//
//  Created by Admin on 15/09/30/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UIWindow+BNNExtensions.h"

@implementation UIWindow (BNNExtensions)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
