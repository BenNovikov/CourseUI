//
//  BNNDataArrayModelChangingPaths.h
//  CourseUI
//
//  Created by Home on 10/12/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNNDataArrayModelChangingPaths : NSObject
@property (nonatomic, readonly) NSIndexPath *sourcePath;
@property (nonatomic, readonly) NSIndexPath *destinationPath;

+ (instancetype)movingFromPath:(NSIndexPath *)sourcePath
                        toPath:(NSIndexPath *)destinationPath;

+ (instancetype)movingFromIndex:(NSUInteger)sourceIndex
                        toIndex:(NSUInteger)destinationIndex;

- (instancetype)initWithSourcePath:(NSIndexPath *)sourcePath
                   destinationPath:(NSIndexPath *)destinationPath;

- (instancetype)initWithSourceIndex:(NSUInteger)sourceIndex
                   destinationIndex:(NSUInteger)destinationIndex;

@end
