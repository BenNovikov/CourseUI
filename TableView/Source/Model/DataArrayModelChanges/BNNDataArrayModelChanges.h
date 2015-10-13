//
//  BNNDataArrayModelChanges.h
//  CourseUI
//
//  Created by Home on 10/7/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNNDataArrayModelChangingPaths.h"

typedef NS_ENUM(NSUInteger, BNNDataArrayModelChangesState) {
    BNNDataArrayModelInsert,
    BNNDataArrayModelDelete,
    BNNDataArrayModelMove
};

@interface BNNDataArrayModelChanges : NSObject
@property (nonatomic, readonly) BNNDataArrayModelChangesState   state;
@property (nonatomic, readonly) BNNDataArrayModelChangingPaths  *paths;

+ (instancetype)changesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state;

- (instancetype)initChangesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state;

@end
