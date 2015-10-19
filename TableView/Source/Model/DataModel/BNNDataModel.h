//
//  BNNDataModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNModel.h"
//#import "BNNImageModel.h"

@interface BNNDataModel : BNNModel
@property(nonatomic, copy)      NSString    *text;
@property(nonatomic, readonly)  UIImage     *image;
//@property(nonatomic, readonly)  BNNImageModel   *imageModel;

+ (instancetype)dataModel;

- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;

- (id)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder *)coder;

@end
