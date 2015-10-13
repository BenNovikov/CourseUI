//
//  BNNDataArrayModelChanges.m
//  CourseUI
//
//  Created by Home on 10/7/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelChanges.h"

@interface BNNDataArrayModelChanges ()
@property (nonatomic, assign) BNNDataArrayModelChangesState     state;
@property (nonatomic, strong) BNNDataArrayModelChangingPaths *paths;

@end

@implementation BNNDataArrayModelChanges

#pragma mark -
#pragma mark Class Methods

+ (instancetype)changesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state {
    return [[self alloc] initChangesWithPaths:paths withState:state];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initChangesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state {
    if((self = [super init])) {
        self.paths = paths;
        self.state = state;
    }
    
    return self;
}

@end
