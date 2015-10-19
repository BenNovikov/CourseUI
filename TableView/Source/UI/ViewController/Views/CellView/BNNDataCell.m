//
//  BNNDataCell.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataCell.h"

#import "BNNDataModel.h"
#import "BNNLoadingView.h"
#import "BNNImageView.h"

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
    BNNObservableSetterSynthesize(model);
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(BNNDataModel *)model {
    self.contentLabel.text = model.text;
    [self.loadingView setVisible:YES];
    self.contentImageView.image = model.imageModel.image;
    [self.loadingView setVisible:NO withAnimation:YES];
}

#pragma mark -
#pragma mark BNNModelStateProtocol

- (void)modelWillLoad:(id)model {
    [self.loadingView setVisible:YES withAnimation:YES];
}

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
    [self.loadingView setVisible:NO withAnimation:YES];
}

- (void)modelDidFailLoading:(id)model{
    [self.model load];
}

@end
