//
//  BNNImageModel.m
//  CourseUI
//
//  Created by Admin on 15/09/28/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageModel.h"

#import "BNNLocalImageModel.h"
#import "BNNURLImageModel.h"
#import "BNNImageModelCache.h"
#import "BNNDispatch.h"

@interface BNNImageModel()
@property (nonatomic, strong)   UIImage             *image;
@property (nonatomic, strong)   NSURL               *url;
@property (nonatomic, strong)   BNNImageModelCache  *cache;

@end

@implementation BNNImageModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.url = nil;
    [self.cache removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self && url) {
        self.url = url;
        
        BNNImageModelCache *cache = [BNNImageModelCache imageModelCache];
        @synchronized(cache) {
            if (![cache containsObjectWithKey:url]) {
                [cache setObject:self forKey:url];
            }
            
            self.cache = cache;
        }
        
        return self;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Class Methods

+ (BNNImageModelCache *)imageModelCache {
    return [BNNImageModelCache imageModelCache];
}

+ (instancetype)imageFromURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}


#pragma mark -
#pragma mark Public Methods

- (void)unload {
    self.image = nil;
    self.state = BNNDataModelDidUnload;
}

#pragma mark -
#pragma mark BNNModel

- (void)performLoading {
    //...

}

@end
