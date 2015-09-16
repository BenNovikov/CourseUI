//
//  UIColor+UIColor_Extensions.m
//  CourseUI
//
//  Created by Admin on 15/09/15/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UIColor+BNNColor.h"
#import "BNNConstants.h"

@implementation UIColor (BNNColor)

#pragma mark -
#pragma mark Public

#define RANDOM_FLOAT(limit) (arc4random() % (limit + 1)) / (float)limit

- (UIColor *)randomColor {
    CGFloat red     = RANDOM_FLOAT(255);
    CGFloat green   = RANDOM_FLOAT(255);
    CGFloat blue    = RANDOM_FLOAT(255);
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:kBNNRandomColorAlpha];
}

#undef RANDOM_FLOAT

@end
