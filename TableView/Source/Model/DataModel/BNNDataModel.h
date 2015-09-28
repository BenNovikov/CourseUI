//
//  BNNDataModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNNAbstractDataModel.h"
#import "BNNImageModel.h"

@interface BNNDataModel : BNNAbstractDataModel
@property(nonatomic, readonly)  BNNImageModel   *imageModel;
@property(nonatomic, copy)      NSString        *text;

+ (instancetype)dataModel;

- (instancetype)initWithString:(NSString *)string;

@end
