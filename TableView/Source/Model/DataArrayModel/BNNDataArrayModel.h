//
//  BNNDataArrayModel.h
//  CourseUI
//
//  Created by Admin on 15/10/05/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNModel.h"

@interface BNNDataArrayModel : BNNModel <NSCoding>
//@property (nonatomic, readonly) NSUInteger  count;
//@property (nonatomic, readonly) NSArray     *array;

@property (nonatomic, readonly) NSArray *modelArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count NS_DESIGNATED_INITIALIZER;

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

- (id)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder *)coder;

@end
