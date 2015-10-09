//
//  BNNDataArrayModelModification.m
//  CourseUI
//
//  Created by Home on 10/7/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelModification.h"

@interface BNNDataArrayModelModification ()
@property (nonatomic, assign) BNNDataArrayModelModificationState  state;
@property (nonatomic, strong) id                                  object;

@end

@implementation BNNDataArrayModelModification

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modificationForObject:(id)object withState:(NSUInteger)state {
    return [[self alloc] initWithObject:object withState:state];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initWithObject:(id)object withState:(NSUInteger)state {
    if((self = [super init])) {
        self.object = object;
        self.state = state;
    }
    
    return self;
}

@end
