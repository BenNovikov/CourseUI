//
//  BNNDispatch.m
//  CourseUI
//
//  Created by Home on 15/10/21.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDispatch.h"

void BNNDispatchOnMainQueue(void(^block)(void)) {
    if (block) {
        if ([NSThread isMainThread]) {
            block();
        } else {
            dispatch_sync(dispatch_get_main_queue(), block);
        }
    }
}

void BNNDispatchAsyncOnMainThread(void(^block)(void)) {
    if (block) {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void BNNDispatchAsyncOnBackgroundThread(void(^block)(void)) {
    if (block) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
    }
}
