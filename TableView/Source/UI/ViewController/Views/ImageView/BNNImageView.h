//
//  BNNImageView.h
//  CourseUI
//
//  Created by Home on 15/10/18.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNLoadingView.h"

@class BNNImageModel;

@interface BNNImageView : BNNLoadingView
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) BNNImageModel *model;

@end
