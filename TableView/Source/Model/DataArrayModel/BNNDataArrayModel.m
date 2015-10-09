//
//  BNNDataArrayModel.m
//  CourseUI
//
//  Created by Admin on 15/10/05/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModel.h"
#import "BNNDataModel.h"

@interface BNNDataArrayModel ()
//@property (nonatomic, strong)   NSMutableArray  *mutableObjects;
@property (nonatomic, strong)   NSMutableArray  *mutableModelArray;

@end

@implementation BNNDataArrayModel

@dynamic modelArray;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)dataWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        self.mutableModelArray = [NSMutableArray arrayWithCapacity:count];
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithModelsCount:0];
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    @synchronized (self) {
        return self.mutableModelArray.count;
    }
}

- (id)modelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return [self.mutableModelArray objectAtIndex:index];
    }
}

- (id)modelAtIndexedSubscript:(NSUInteger)index {
    @synchronized (self) {
        return [self.mutableModelArray objectAtIndexedSubscript:index];
    }
}

- (void)addModel:(id)model {
    @synchronized (self) {
        NSMutableArray *array = self.mutableModelArray;
        [array addObject:model];
        
        NSIndexPath *destinationPath = [NSIndexPath indexPathWithIndex:[array count] - 1];
        
        [self setState:BNNDataModelDidChange];
    }
}

- (void)removeModel:(id)model {
    [self.mutableModelArray removeObject:model];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.mutableModelArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableModelArray removeObjectAtIndex:index];
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    [self.mutableModelArray replaceObjectAtIndex:destinationIndex
                                      withObject:[self.mutableModelArray objectAtIndex:sourceIndex]];
}

- (void)replaceModelAtIndex:(NSUInteger)destinationIndex withModelAtIndex:(NSUInteger)sourceIndex {
    NSMutableArray *array = self.mutableModelArray;
    BNNDataModel *tempModel = [array objectAtIndex:sourceIndex];
    [array removeObject:tempModel];
    [array replaceObjectAtIndex:destinationIndex withObject:tempModel];
}


@end
