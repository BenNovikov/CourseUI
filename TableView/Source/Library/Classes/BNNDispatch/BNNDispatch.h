//
//  BNNDispatch.h
//  CourseUI
//
//  Created by Home on 15/10/21.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
void BNNDispatchOnMainQueue(void(^block)(void));

extern
void BNNDispatchAsyncOnMainThread(void(^block)(void));

extern
void BNNDispatchAsyncOnBackgroundThread(void(^block)(void));
