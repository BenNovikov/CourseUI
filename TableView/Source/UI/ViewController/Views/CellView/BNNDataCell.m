//
//  BNNDataCell.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataCell.h"

#import "BNNDataModel.h"
#import "BNNImageView.h"

#import "BNNMacros.h"

@implementation BNNDataCell

@dynamic state;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(BNNDataModel *)model {
    BNNSynthesizeObservableSetter(model);
 
    [self fillWithModel:model];
    
    [model load];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(BNNDataModel *)model {
    self.contentLabel.text = model.text;
    self.contentImageView.image = model.image;
}

#pragma mark -
#pragma mark BNNObservableModel

- (void)modelWillLoad:(id)model {
    self.contentSpinnerView.hidesWhenStopped = YES;
    [self.contentSpinnerView startAnimating];
    BNNLogForObject(@"modelWillLoad:%@", model);
}

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
    [self.contentSpinnerView stopAnimating];
}

- (void)modelDidFailLoading:(id)model{
    [self.model load]; //logic should be added here to avoid infinite cycle
}

@end
