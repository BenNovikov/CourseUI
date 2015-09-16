//
//  BNNRectView.h
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNNRectModel.h"

@interface BNNRectView : UIView
@property (nonatomic, weak)         IBOutlet        UIView          *rectView;
@property (nonatomic, weak)         IBOutlet        UIButton        *animationButton;

@property(nonatomic, strong)                        BNNRectModel    *rectModel;

@property (nonatomic, assign, getter=isAnimationRunning)    BOOL    animationRunning;

- (void)setRectPosition:(BNNRectPositionType)position;
- (void)setRectPosition:(BNNRectPositionType)position
               animated:(BOOL)animated;
- (void)setRectPosition:(BNNRectPositionType)position
               animated:(BOOL)animated
             completion:(void(^)(BOOL finished))block;

- (void)animateRect;

@end
