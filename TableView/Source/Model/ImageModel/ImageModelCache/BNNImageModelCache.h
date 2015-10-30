//
//  BNNImageModelCache.h
//  CourseUI
//
//  Created by Home on 15/10/28.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNNImageModelCache : NSObject

+ (id)imageModelCache;

- (id)objectForKey:(NSURL *)path;
- (void)removeObjectForKey:(NSURL *)path;
- (void)setObject:(id)anObject forKey:(NSURL *)path;
- (void)removeAllObjects;

- (BOOL)containsObjectWithKey:(NSURL *)path;

@end
