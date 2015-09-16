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

#pragma mark -
#pragma mark Public

- (CGFloat)randomScale {
    return (float)(arc4random() % (int)(kBNNAffineTransformScaleUpperLimit * 100 + 1)) / 100 + kBNNAffineTransformScaleLowerLimit;
}

- (CGFloat)randomRotation {
    return (float)(arc4random() % (int)(M_PI * 2 * 100)) / 100 - M_PI;
}

@end
