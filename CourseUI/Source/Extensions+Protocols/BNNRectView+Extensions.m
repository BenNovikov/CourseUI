//
//  BNNRectViewController+Extensions.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNRectView+Extensions.h"
#import "BNNConstants+Macros.h"

@implementation BNNRectView (Extensions)

- (UIColor *)randomColor {
    CGFloat r = GetRandomCGFloat(255);
    CGFloat g = GetRandomCGFloat(255);
    CGFloat b = GetRandomCGFloat(255);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:kBNNRandomColorAlpha];
}

- (CGFloat)randomScale {
    return (float)(arc4random() % (int)(kBNNAffineTransformScaleUpperLimit * 100 + 1)) / 100 + kBNNAffineTransformScaleLowerLimit;
}

- (CGFloat)randomRotation {
    return (float)(arc4random() % (int)(M_PI * 2 * pow(10, 6))) / pow(10, 6) - M_PI;
}

@end
