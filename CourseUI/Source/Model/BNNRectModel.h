//
//  BNNRectModel.h
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BNNConstants.h"
#import "BNNMacros.h"

@interface BNNRectModel : NSObject
@property(nonatomic, unsafe_unretained) BNNRectPositionType position;

- (instancetype)initWithPosition:(BNNRectPositionType)position;
- (BNNRectPositionBlock)nextPositionBlock;
- (CGRect)frame:(CGRect)viewFrame atPosition:(BNNRectPositionType)position;

@end
