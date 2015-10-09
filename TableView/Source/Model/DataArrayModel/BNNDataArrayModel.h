//
//  BNNDataArrayModel.h
//  CourseUI
//
//  Created by Admin on 15/10/05/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNModelArray.h"

@interface BNNDataArrayModel : BNNModelArray
//@property (nonatomic, readonly) NSUInteger  count;
//@property (nonatomic, readonly) NSArray     *array;

@property (nonatomic, readonly) NSArray *modelArray;

+ (instancetype)dataWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count NS_DESIGNATED_INITIALIZER;

- (NSUInteger)count;

- (id)modelAtIndex:(NSUInteger)index;
- (id)modelAtIndexedSubscript:(NSUInteger)index;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)moveModelAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;
- (void)replaceModelAtIndex:(NSUInteger)sourceIndex withModelAtIndex:(NSUInteger)destinationIndex;

@end
