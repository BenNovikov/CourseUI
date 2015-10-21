//
//  BNNDataCell.h
//  CourseUI
//
//  Created by Admin on 15/09/29.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNTableViewCell.h"

#import "BNNLoadingView.h"
#import "BNNObservableObject.h"

@class BNNDataModel;
@class BNNImageView;

@interface BNNDataCell : BNNTableViewCell <BNNObservableModel>
@property (nonatomic, strong) IBOutlet UILabel                  *contentLabel;
@property (nonatomic, strong) IBOutlet BNNImageView             *contentImageView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *contentSpinnerView;

@property (nonatomic, strong) BNNDataModel          *model;

- (void)fillWithModel:(BNNDataModel *)model;

@end
