//
//  BNNImageModelCache.m
//  CourseUI
//
//  Created by Home on 15/10/28.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageModelCache.h"

@interface BNNImageModelCache()
@property (nonatomic, strong) NSMapTable   *mapTable;

@end

@implementation BNNImageModelCache

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapTable = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (id)imageModelCache {
    static BNNImageModelCache *__cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __cache = [[BNNImageModelCache alloc] init];
    });
    
    return __cache;
}

#pragma mark -
#pragma mark Public Methods

- (id)objectForKey:(NSURL *)path {
    @synchronized(self) {
        return [self.mapTable objectForKey:path];
    }
}

- (void)removeObjectForKey:(NSURL *)path {
    @synchronized(self) {
        [self.mapTable removeObjectForKey:path];
    }
}

- (void)setObject:(id)anObject forKey:(NSURL *)path {
    @synchronized(self) {
        [self.mapTable setObject:anObject forKey:path];
    }
}

- (void)removeAllObjects {
    @synchronized(self) {
        [self.mapTable removeAllObjects];
    }
}

- (BOOL)containsObjectWithKey:(NSURL *)path {
    return (nil != [self objectForKey:path]);
}

@end
