//
//  NSMutableArray+BNNExtensions.m
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSMutableArray+BNNExtensions.h"

@implementation NSMutableArray (BNNExtensions)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    if (sourceIndex != destinationIndex) {
        id object = [self objectAtIndex:sourceIndex];
        if (sourceIndex < destinationIndex) {
            [self removeObjectAtIndex:sourceIndex];
            [self insertObject:object atIndex:destinationIndex];
        } else {
            [self insertObject:object atIndex:destinationIndex];
            [self removeObjectAtIndex:sourceIndex + 1];
        }
    }
}

@end
