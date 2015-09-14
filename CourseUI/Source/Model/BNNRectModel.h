//
//  BNNRectModel.h
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BNNConstants+Macros.h"

@interface BNNRectModel : NSObject
@property(nonatomic, unsafe_unretained) BNNRectPositionType position;
//@property(nonatomic, unsafe_unretained) CGFloat             width;
//@property(nonatomic, unsafe_unretained) CGFloat             height;

- (instancetype)initWithPosition:(BNNRectPositionType)position;

@end
