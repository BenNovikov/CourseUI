//
//  BNNDataArrayModelChangingPaths.m
//  CourseUI
//
//  Created by Home on 10/12/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelChangingPaths.h"

#import "NSIndexPath+BNNExtensions.h"

@interface BNNDataArrayModelChangingPaths ()
@property (nonatomic, strong)   NSIndexPath *sourcePath;
@property (nonatomic, strong)   NSIndexPath *destinationPath;

@end

@implementation BNNDataArrayModelChangingPaths

#pragma mark -
#pragma mark Class Methods

+ (instancetype)movingFromPath:(NSIndexPath *)sourcePath
                        toPath:(NSIndexPath *)destinationPath
{
    return [[self alloc] initWithSourcePath:sourcePath destinationPath:destinationPath];
}

+ (instancetype)movingFromIndex:(NSUInteger)sourceIndex
                        toIndex:(NSUInteger)destinationIndex
{
    return [[self alloc] initWithSourceIndex:sourceIndex destinationIndex:destinationIndex];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSourcePath:(NSIndexPath *)sourcePath
                   destinationPath:(NSIndexPath *)destinationPath
{
    if((self = [super init])) {
        self.sourcePath = sourcePath;
        self.destinationPath = destinationPath;
    }
    
    return self;
}

- (instancetype)initWithSourceIndex:(NSUInteger)sourceIndex
                   destinationIndex:(NSUInteger)destinationIndex
{
    return [self initWithSourcePath:[NSIndexPath pathWithIndex:sourceIndex]
                    destinationPath:[NSIndexPath pathWithIndex:destinationIndex]];
}

@end
