//
//  BNNImageView.h
//  CourseUI
//
//  Created by Home on 15/10/18.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNView.h"

#import "BNNObservableObject.h"

@class BNNImageModel;

@interface BNNImageView : BNNView
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) BNNImageModel *model;

@end
