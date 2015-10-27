//
//  BNNImageView.m
//  CourseUI
//
//  Created by Home on 15/10/18.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageView.h"

#import "BNNImageModel.h"

#import "BNNMacros.h"

@implementation BNNImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(BNNImageModel *)model {
    BNNSynthesizeObservableSetter(model);
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(BNNImageModel *)model {
    self.image = model.image;
}

#pragma mark -
#pragma mark BNNModelObserver

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
}

@end
