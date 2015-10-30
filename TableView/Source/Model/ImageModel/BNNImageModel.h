//
//  BNNImageModel.h
//  CourseUI
//
//  Created by Admin on 15/09/28.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNModel.h"
#import "BNNImageModelCache.h"

@class BNNImageModelCache;

@interface BNNImageModel : BNNModel
@property (nonatomic, readonly) UIImage             *image;
@property (nonatomic, readonly) NSURL               *url;
@property (nonatomic, readonly) BNNImageModelCache  *cache;

+ (BNNImageModelCache *)imageModelCache;

+ (instancetype)imageFromURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;



@end
