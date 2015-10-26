//
//  BNNDataCell.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataCell.h"

#import "BNNDataModel.h"

#import "BNNMacros.h"

@implementation BNNDataCell

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
    
    UIActivityIndicatorView *spinner = self.contentSpinnerView;

    [spinner startAnimating];
    
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

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
    
    [self.contentSpinnerView stopAnimating];
}

- (void)modelDidFailLoading:(id)model{
    [self.model load]; //some logic should be added to avoid infinite loading cycles
}

@end
