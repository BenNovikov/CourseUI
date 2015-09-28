//
//  BNNImageModel.h
//  CourseUI
//
//  Created by Admin on 15/09/28/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAbstractDataModel.h"
#import <UIKit/UIKit.h>

@interface BNNImageModel : BNNAbstractDataModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageFromURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

//- (void)load;
- (void)unload;

@end
