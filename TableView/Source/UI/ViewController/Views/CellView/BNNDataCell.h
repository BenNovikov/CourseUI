//
//  BNNDataCell.h
//  CourseUI
//
//  Created by Admin on 15/09/29.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNTableViewCell.h"

#import "BNNImageView.h"
#import "BNNLoadingView.h"
#import "BNNObservableObject.h"

#import "BNNModelObserver.h"

@class BNNDataModel;

@interface BNNDataCell : BNNTableViewCell <BNNModelObserver>
@property (nonatomic, strong) IBOutlet UILabel                  *contentLabel;
@property (nonatomic, strong) IBOutlet BNNImageView             *contentImageView; //UIImageView
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *contentSpinnerView;

@property (nonatomic, strong) BNNDataModel          *model;

- (void)fillWithModel:(BNNDataModel *)model;

@end
