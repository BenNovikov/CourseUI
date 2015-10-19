//
//  BNNRectModel.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNRectModel.h"
#import "BNNRectView.h"
#import "BNNRectViewController.h"

@implementation BNNRectModel

#pragma mark -
#pragma mark Public

- (instancetype)initWithPosition:(BNNRectPositionType)position {
    self = [super init];
    if (self) {
        self.position = position;
    }
    
    return self;
}

- (BNNRectPositionType)nextPosition {
    return (self.position + 1) % BNNRectPositionTypeCount;
}

@end
