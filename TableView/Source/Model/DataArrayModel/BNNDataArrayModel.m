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
#import "NSMutableArray+BNNExtensions.h"

static NSString * const kBNNMutableModelArrayKey = @"mutableModelArray";

@interface BNNDataArrayModel ()
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
        
        BNNDataArrayModelChanges *changes = [BNNDataArrayModelChanges changesWithIndicesSource:index
                                                                                   destination:index
                                                                                     withState:BNNDataArrayModelInsert];
        [self setState:BNNDataModelDidChange withObject:changes];
    }
}

- (void)removeModel:(id)model {
    [self removeModelAtIndex:[self.mutableModelArray indexOfObject:model]];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        [self.mutableModelArray removeObjectAtIndex:index];
        
        BNNDataArrayModelChanges *changes = [BNNDataArrayModelChanges changesWithIndicesSource:index
                                                                                   destination:index
                                                                                     withState:BNNDataArrayModelDelete];
        [self setState:BNNDataModelDidChange withObject:changes];
    }
}

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    NSMutableArray *array = self.mutableModelArray;
//        [array moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
    [array exchangeObjectAtIndex:sourceIndex withObjectAtIndex:destinationIndex];
    BNNDataArrayModelChanges *changes = [BNNDataArrayModelChanges changesWithIndicesSource:sourceIndex
                                                                               destination:destinationIndex
                                                                                 withState:BNNDataArrayModelMove];
    [self setState:BNNDataModelDidChange withObject:changes];
}

- (void)addModelsFromArray:(NSArray *)anArray {
    
}

- (void)removeModelsInArray:(NSArray *)anArray {
    
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.mutableModelArray = [aDecoder decodeObjectForKey:kBNNMutableModelArrayKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.mutableModelArray forKey:kBNNMutableModelArrayKey];
}

@end
