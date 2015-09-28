//
//  BNNImageModel.m
//  CourseUI
//
//  Created by Admin on 15/09/28/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageModel.h"

@interface BNNImageModel()
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation BNNImageModel

#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.url = nil;
    [self unload];
}

#pragma mark - Class Methods

+ (instancetype)imageFromURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark - Public Methods

- (instancetype)initWithURL:(NSURL *)url {
    @synchronized(self) {
        if((self = [super init])) {
            self.url = url;
        }
        
        return self;
    }
}

- (void)unload {
    self.image = nil;
}

#pragma mark - BNNAbstractDataModel

- (void)initiateLoading {
    NSLog(@"Image Loading Started...");
}

- (void)startLoading {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = self.url.path;
    UIImage *image = self.image;
    image = [UIImage imageWithContentsOfFile:path];
//        (NSString *)name = self.url.absoluteString;
//        image = [UIImage imageNamed:name];
    if(image) {
        self.image = image;
        self.state = BNNDataModelDidLoad;
    } else {
        
        self.state = BNNDataModelDidFailLoading;
    }
    
    return self;
}

@end
