//
//  BNNDataCell.h
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNTableViewCell.h"

@class BNNDataModel;

@interface BNNDataCell : BNNTableViewCell
@property (nonatomic, strong) IBOutlet UILabel      *contentLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *contentImageView;
@property (nonatomic, strong) BNNDataModel          *model;

- (void)fillWithModel:(BNNDataModel *)model;

@end
