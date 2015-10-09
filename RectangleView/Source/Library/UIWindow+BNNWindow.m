//
//  UIWindow+BNNWindow.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UIWindow+BNNWindow.h"
#import "BNNConstants.h"

@implementation UIWindow (BNNWindow)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
