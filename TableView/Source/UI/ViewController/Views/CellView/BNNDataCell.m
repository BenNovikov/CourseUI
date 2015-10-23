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
    spinner.hidesWhenStopped = YES;
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

- (void)modelWillLoad:(id)model {
    BNNLogForObject(@"@Cell: %@", self);
    BNNLogForObject(@"modelWillLoad: %@", model);
}

- (void)modelDidLoad:(id)model {
    
    /*
     *  it comes here only when the table is moved OUT of the screen
     *  first of all i thought i've got big troubles with notification
     *  but in a few hours later i guess it should be some kind of other magic 
    */
    
    [self fillWithModel:model];
    [self.contentSpinnerView stopAnimating];
    //
    self.contentSpinnerView = nil;
}

- (void)modelDidFailLoading:(id)model{
    [self.model load]; //some logic should be added to avoid infinite loading cycles
}

@end
