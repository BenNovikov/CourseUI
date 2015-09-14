//
//  BNNMacros.h
//  CourseUI
//
//  Created by Admin on 15/09/14/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef CourseUI_BNNMacros_h
#define CourseUI_BNNMacros_h

//get min/max GetOriginAdjustedForMainScreenBounds
#define BNN_MINMAX_BOUNDS(screenBound, subtractX, subtractY) \
screenBound.origin.x = [[UIScreen mainScreen] bounds].size.width - subtractX; \
screenBound.origin.y = [[UIScreen mainScreen] bounds].size.height - subtractY

//GetRandomCGFloat
#define BNN_RANDOM_FLOAT(limit) (CGFloat)(arc4random() % (limit + 1)) / (float)limit

#endif
