//
//  BNNConstants.h
//  CourseUI
//
//  Created by Admin on 15/09/13/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef CourseUI_BNNConstants_h
#define CourseUI_BNNConstants_h

#define BNN_NSTIMEINTERVAL_KEY(key, value) static NSTimeInterval const key = value
BNN_NSTIMEINTERVAL_KEY(kBNNRectangleAnimationDuration,  1.0);
BNN_NSTIMEINTERVAL_KEY(kBNNRectangleAnimationDelay,     0.5);

#define BNN_FLOAT_KEY(key, value) static float const key = value
BNN_FLOAT_KEY(kBNNAffineTransformScaleUpperLimit,       1.5f);
BNN_FLOAT_KEY(kBNNAffineTransformScaleLowerLimit,       0.5f);
BNN_FLOAT_KEY(kBNNRandomColorAlpha,                     1.f);
BNN_FLOAT_KEY(kBNNRectSizeWidth,                        100.f);
BNN_FLOAT_KEY(kBNNRectSizeHeigh,                        100.f);

#endif
