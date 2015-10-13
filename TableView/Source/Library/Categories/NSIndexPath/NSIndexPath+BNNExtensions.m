//
//  NSIndexPath+BNNExtensions.m
//  CourseUI
//
//  Created by Home on 10/12/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "NSIndexPath+BNNExtensions.h"

@implementation NSIndexPath (BNNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)pathWithIndex:(NSUInteger)index {
    return [self indexPathForRow:index inSection:0];
}

@end
