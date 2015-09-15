//
//  BNNUIWindow+BNNWindow.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNUIWindow+BNNWindow.h"
#import "BNNConstants.h"

@implementation UIWindow (BNNWindow)

- (CGFloat)randomScale {
    return (float)(arc4random() % (int)(kBNNAffineTransformScaleUpperLimit * 100 + 1)) / 100 + kBNNAffineTransformScaleLowerLimit;
}

- (CGFloat)randomRotation {
    return (float)(arc4random() % (int)(M_PI * 2 * pow(10, 6))) / pow(10, 6) - M_PI;
}

@end
