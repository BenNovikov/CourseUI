//
//  BNNImageModel.m
//  CourseUI
//
//  Created by Admin on 15/09/28/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageModel.h"

//static NSString * const kBNNImageFileName = @"01";
//static NSString * const kBNNImageFileType = @"jpg";


@interface BNNImageModel()
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation BNNImageModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.url = nil;
    [self unload];
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageFromURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initWithURL:(NSURL *)url {
    @synchronized(self) {
        if((self = [super init])) {
            self.url = url;
        }
        
        //cache call to be realized before loading
        
        self.state = BNNDataModelDidUnload;
        [self load];
        
        return self;
    }
}

- (void)unload {
    self.image = nil;
    self.state = BNNDataModelDidUnload;
}

#pragma mark -
#pragma mark BNNModel

- (void)initiateLoading {
//    NSLog(@"Image Loading Started...state:%lu", (unsigned long)self.state);
}

- (void)performLoading {
    NSString *imageName = self.url.absoluteString;
//    NSLog(@"Full path: %@", imageName);
    
    UIImage *image = [UIImage imageNamed:imageName];

    self.image = image;
    self.state = image ? BNNDataModelDidLoad : BNNDataModelDidFailLoading;
}

@end
