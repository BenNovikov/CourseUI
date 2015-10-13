//
//  BNNDataArrayModel.m
//  CourseUI
//
//  Created by Admin on 15/10/05/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModel.h"
#import "BNNDataModel.h"
#import "BNNDataArrayModelChanges.h"

#import "NSIndexPath+BNNExtensions.h"

static NSString * const BNNMutableModelArray = @"mutableModelArray";

@interface BNNDataArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableModelArray;

- (BNNDataArrayModelChanges *)changesWithIndiciesSource:(NSUInteger)sourceIndex
                                            destination:(NSUInteger)destinationIndex
                                                  state:(BNNDataArrayModelChangesState)state;

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
    if ((self = [super init])) {
        self.mutableModelArray = [NSMutableArray arrayWithCapacity:count];
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithModelsCount:0];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)modelArray {
    @synchronized(self) {
        return [self.mutableModelArray copy];
    }
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
    NSUInteger index = [self.mutableModelArray count];
//    NSUInteger index = count ? count : 1;
    [self insertModel:model atIndex:index];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    @synchronized (self) {
        NSMutableArray *array = self.mutableModelArray;
        if ([array count]) {
            [array insertObject:model atIndex:index];
        } else {
            [array addObject:model];
        }
        
        BNNDataArrayModelChanges *changes = [self changesWithIndiciesSource:index
                                                                destination:index
                                                                      state:BNNDataArrayModelInsert];
        [self setState:BNNDataModelDidChange withObject:changes];
    }
}

- (void)removeModel:(id)model {
    [self removeModelAtIndex:[self.mutableModelArray indexOfObject:model]];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        [self.mutableModelArray removeObjectAtIndex:index];
        
        BNNDataArrayModelChanges *changes = [self changesWithIndiciesSource:index
                                                                destination:index
                                                                      state:BNNDataArrayModelDelete];
        [self setState:BNNDataModelDidChange withObject:changes];
    }
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    if (sourceIndex != destinationIndex) {
        BNNDataModel *tempModel = [self modelAtIndex:sourceIndex];
        [self removeModelAtIndex:sourceIndex];
        [self insertModel:tempModel atIndex:destinationIndex];
        
        BNNDataArrayModelChanges *changes = [self changesWithIndiciesSource:sourceIndex
                                                                destination:destinationIndex
                                                                      state:BNNDataArrayModelMove];
        [self setState:BNNDataModelDidChange withObject:changes];
    }
}

- (void)addModelsFromArray:(NSArray *)anArray {
    
}

- (void)removeModelsInArray:(NSArray *)anArray {
    
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        self.mutableModelArray = [coder decodeObjectForKey:BNNMutableModelArray];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.mutableModelArray forKey:BNNMutableModelArray];
}

#pragma mark -
#pragma mark private Methods

- (BNNDataArrayModelChanges *)changesWithIndiciesSource:(NSUInteger)sourceIndex
                                            destination:(NSUInteger)destinationIndex
                                                  state:(BNNDataArrayModelChangesState)state
{
    return [BNNDataArrayModelChanges changesWithPaths:[BNNDataArrayModelChangingPaths movingFromIndex:sourceIndex
                                                                                              toIndex:destinationIndex]
                                            withState:state];
}

@end
