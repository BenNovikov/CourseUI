
//
//  BNNConstants.h
//  CourseUI
//
//  Created by Admin on 15/09/28/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#define BNNDebugMode 1

#define BNN_NSSTRING_KEY(key, value) static NSString * const key = value
BNN_NSSTRING_KEY(kBNNImageName,         @"01.jpg");

#define BNN_NSUINT_KEY(key, value) static NSUInteger const key = value
BNN_NSUINT_KEY(kBNNRandomStringLength,  10);

#define BNN_CGFLOAT_KEY(key, value) static double const key = value
BNN_CGFLOAT_KEY(kBNNVisibleAlpha,       1.0);
BNN_CGFLOAT_KEY(kBNNInvisibleAlpha,     0.0);

#define BNN_NSTIME_KEY(key, value) static NSTimeInterval const key = value
BNN_NSTIME_KEY(kBNNAnimationDuration,   2.0);
BNN_NSTIME_KEY(kBNNSleepDuration,       0.5);

