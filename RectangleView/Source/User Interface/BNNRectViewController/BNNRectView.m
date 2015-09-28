//
//  BNNRectView.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNRectView.h"
#import "UIColor+BNNColor.h"
#import "UIWindow+BNNWindow.h"

@interface BNNRectView()

- (CGRect)frameAtPosition:(BNNRectPositionType)position;
- (void)animateRect;

@end

@implementation BNNRectView

#pragma mark -
#pragma mark Public

- (void)setRectPosition:(BNNRectPositionType)position {
    [self setRectPosition:position animated:NO];
}

- (void)setRectPosition:(BNNRectPositionType)position
               animated:(BOOL)animated
{
    [self setRectPosition:position animated:animated completion:nil];
}

- (void)setRectPosition:(BNNRectPositionType)position
               animated:(BOOL)animated
             completion:(void(^)(BOOL finished))block
{
    NSTimeInterval duration = animated ? kBNNRectangleAnimationDuration : 0;
    NSTimeInterval delay    = animated ? kBNNRectangleAnimationDelay : 0;
    CGRect frame = [self frameAtPosition:position];
    [self animateRect];
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         UIView *currentView = self.rectView;
                         currentView.frame = frame;
                         currentView.backgroundColor = [currentView.backgroundColor randomColor];
                     }
                     completion:^(BOOL finished) {
                         self.rectModel.position = position;
                         
                         if (block) {
                             block(finished);
                         }
                     }];
}

- (void)animateRect {
    if (self.animationRunning) {
        __weak typeof(self) weakSelf = self;
        [weakSelf setRectPosition:[self.rectModel nextPosition] animated:YES completion:^(BOOL finished) {
            if (finished) {
                __strong typeof(self) self = weakSelf;
                [self animateRect];
            }
        }];
    }
}

#pragma mark -
#pragma mark Private

#define SIZE_X_SUBTRACT(minuend, subtrahend) minuend.size.width  - subtrahend.size.width
#define SIZE_Y_SUBTRACT(minuend, subtrahend) minuend.size.height - subtrahend.size.height

- (CGRect)frameAtPosition:(BNNRectPositionType)position
{
    CGRect  frame               = self.rectView.frame;
    CGRect  applicationFrame    = [[UIScreen mainScreen] applicationFrame];
    CGPoint point = CGPointZero;
    
    switch(position) {
        case BNNTopRightCorner:
            point.x = SIZE_X_SUBTRACT(applicationFrame, frame);
            break;
            
        case BNNBottomRightCorner:
            point.x = SIZE_X_SUBTRACT(applicationFrame, frame);
            point.y = SIZE_Y_SUBTRACT(applicationFrame, frame);
            break;
            
        case BNNBottomLeftCorner:
            point.y = SIZE_Y_SUBTRACT(applicationFrame, frame);
            break;
            
        default:
            break;
    }
    frame.origin = point;
    
    return frame;
}

#undef SIZE_Y_SUBTRACT
#undef SIZE_X_SUBTRACT

@end
