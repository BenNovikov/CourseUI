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
#pragma Initializations and Deallocations

- (instancetype)initWithPosition:(BNNRectPositionType)position {
    if ((self = [super init])) {
        self.position = position;
    }
    
    return self;
}

@end
