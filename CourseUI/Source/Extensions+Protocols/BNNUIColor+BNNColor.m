//
//  BNNUIColor+BNNUIColor_Extensions.m
//  CourseUI
//
//  Created by Admin on 15/09/15/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNUIColor+BNNColor.h"
#import "BNNConstants.h"
#import "BNNMacros.h"

@implementation UIColor (BNNColor)

- (UIColor *)randomColor {
    CGFloat r = BNN_RANDOM_FLOAT(255);
    CGFloat g = BNN_RANDOM_FLOAT(255);
    CGFloat b = BNN_RANDOM_FLOAT(255);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:kBNNRandomColorAlpha];
}

@end
