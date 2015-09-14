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

- (BNNRectPositionBlock)nextPositionBlock {
    BNNRectPositionBlock result = ^{
        return (self.position + 1) % BNNRectPositionTypeCount;
    };
    
    return result;
}

- (CGRect)frame:(CGRect)viewFrame atPosition:(BNNRectPositionType)position
{
    CGRect  frame           = viewFrame;
    CGFloat frameWidth      = frame.size.width;
    CGFloat frameHeight     = frame.size.height;
    CGRect screenBounds     = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth     = screenBounds.size.width;
    CGFloat screenHeight    = screenBounds.size.height;
    
    frame.origin.x = ((position & 1) ^ ((position & (1 << 1)) >> 1)) * (screenWidth - frameWidth);
    frame.origin.y = ((position & (1 << 1)) >> 1) * (screenHeight - frameHeight);
    
    return frame;
}

@end
