//
//  BNNURLImageModel.m
//  CourseUI
//
//  Created by Home on 15/10/29.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNURLImageModel.h"

@interface BNNURLImageModel()
@property (nonatomic, strong)   UIImage             *image;

//probably should be moved to URLImageModel or NSFileManager+Cache
- (void)deleteCache;

@end

@implementation BNNURLImageModel

@dynamic image;

#pragma mark -
#pragma mark BNNImageModel

- (void)performLoading {
    //...
    
    if (self.cached) {
        [super performLoading];
    }
    
    UIImage *image = [self.cache objectForKey:self.url];
    if (!image) {
        [self deleteCache];
    }
    
    self.image = image;
    
    
    BNNWeakify(self);
    BNNDispatchAsyncOnMainThread(^{
        BNNStrongifyAndReturnIfNil(self);
        self.state = image ? BNNDataModelDidLoad : BNNDataModelDidFailLoading;
    });
}


#pragma mark -
#pragma mark Private

- (void)deleteCache {
    if (self.cached) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:&error];
    }
}

@end
