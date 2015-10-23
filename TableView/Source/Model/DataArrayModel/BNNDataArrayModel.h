//
//  BNNDataArrayModel.h
//  CourseUI
//
//  Created by Admin on 15/10/05/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNArrayModel.h"

@interface BNNDataArrayModel : BNNArrayModel  <NSCoding>

@property (nonatomic, readonly) NSArray *modelArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count;

- (NSUInteger)count;

- (id)modelAtIndex:(NSUInteger)index;
- (id)modelAtIndexedSubscript:(NSUInteger)index;

- (void)addModel:(id)model;
- (void)insertModel:(id)model atIndex:(NSUInteger)index;

- (void)removeModel:(id)model;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

- (void)addModelsFromArray:(NSArray *)anArray;
- (void)removeModelsInArray:(NSArray *)anArray;

@end
