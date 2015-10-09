//
//  BNNDataArrayModelModification.h
//  CourseUI
//
//  Created by Home on 10/7/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BNNDataArrayModelModificationState) {
    BNNDataArrayModelAdd,
    BNNDataArrayModelDelete,
    BNNDataArrayModelMove
};

@interface BNNDataArrayModelModification : NSObject
@property (nonatomic, readonly) BNNDataArrayModelModificationState  state;
@property (nonatomic, readonly) id                                  object;

+ (instancetype)modificationForObject:(id)object withState:(NSUInteger)state;

- (instancetype)initWithObject:(id)object withState:(NSUInteger)state;

@end
