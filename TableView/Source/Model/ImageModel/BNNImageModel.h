//
//  BNNImageModel.h
//  CourseUI
//
//  Created by Admin on 15/09/28.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNModel.h"
#import <UIKit/UIKit.h>

//
//  you should never use this class
//  until you reach 3rd task completion
//  to implement all of these in consequent realizations.
//  in other words it's task #4+ class only
//

@interface BNNImageModel : BNNModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageFromURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

//- (void)load;
- (void)unload;

@end
