//
//  BNNDataModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNNModel.h"
#import "BNNImageModel.h"

@interface BNNDataModel : BNNModel <NSCoding>
@property(nonatomic, readonly)  BNNImageModel   *imageModel;
@property(nonatomic, copy)      NSString        *text;

+ (instancetype)dataModel;

- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;

- (id)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder *)coder;

@end
