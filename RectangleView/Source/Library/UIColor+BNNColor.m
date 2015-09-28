//
//  UIColor+UIColor_Extensions.m
//  CourseUI
//
//  Created by Admin on 15/09/15/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <stdlib.h>

#import "UIColor+BNNColor.h"
#import "BNNConstants.h"

@implementation UIColor(BNNColor)

#pragma mark -
#pragma mark Public

- (double)BNNRandomColor {
    return (double)((arc4random_uniform(RAND_MAX) + 1)/RAND_MAX);
}

- (UIColor *)randomColor {
    CGFloat red     = [self BNNRandomColor];
    CGFloat green   = [self BNNRandomColor];
    CGFloat blue    = [self BNNRandomColor];
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:kBNNRandomColorAlpha];
}

@end
