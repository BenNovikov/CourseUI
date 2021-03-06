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

typedef NS_ENUM(NSUInteger, BNNRectPositionType) {
    BNNTopLeftCorner,
    BNNTopRightCorner,
    BNNBottomRightCorner,
    BNNBottomLeftCorner,
    BNNRectPositionTypeCount
};

@interface BNNRectModel : NSObject
@property(nonatomic, unsafe_unretained) BNNRectPositionType position;

- (instancetype)initWithPosition:(BNNRectPositionType)position;
- (BNNRectPositionType)nextPosition;

@end
