//
//  NSMutableArray+BNNExtensions.h
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BNNExtensions)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

@end
