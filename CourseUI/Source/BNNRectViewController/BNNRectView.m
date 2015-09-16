//
//  BNNRectView.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNRectView.h"
#import "BNNUIWindow+BNNWindow.h"
#import "BNNUIColor+BNNColor.h"

@interface BNNRectView()

- (CGRect)frame:(CGRect)viewFrame atPosition:(BNNRectPositionType)position;

//- (void)moveRectWithBlock:(BNNRectPositionType(^)(void))block;
//- (void)moveRectToPosition:(BNNRectPositionType)position;
//- (BNNRectPositionBlock)nextPositionBlock;

@end

@implementation BNNRectView

#pragma mark -
#pragma mark Accessors

- (void)setRect:(BNNRectModel *)rectModel {
    if (rectModel != _rectModel) {
        _rectModel = rectModel;
    }
    
    self.rectView.frame = [self frame:self.rectView.frame atPosition:rectModel.position];
}

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
    NSTimeInterval delay = animated ? kBNNRectangleAnimationDelay : 0;
    CGRect frame = [self frame:self.rectView.frame atPosition:position];
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

#pragma mark -
#pragma mark Private

- (CGRect)frame:(CGRect)viewFrame atPosition:(BNNRectPositionType)position
{
    CGRect  frame           = viewFrame;
    CGFloat frameWidth      = frame.size.width;
    CGFloat frameHeight     = frame.size.height;
    CGRect screenBounds     = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth     = screenBounds.size.width;
    CGFloat screenHeight    = screenBounds.size.height;
    
    frame.origin.x = ((position & 1) ^ ((position & (1 << 1)) >> 1)) * (screenWidth - frameWidth);
    frame.origin.y = ((position & (1 << 1)) >> 1) * (screenHeight - frameHeight);
    
    return frame;
}


#pragma mark -
#pragma mark 2BeKilledLater

//- (void)moveRectWithBlock:(BNNRectPositionType(^)(void))block {
//    if (self. animationRunning) {
//        BNNRectPositionType position = block();
//        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished){
//            self.rectModel.position = position;
//            if (finished) {
//                [self moveRectWithBlock:block];
//            }
//        }];
//    }
//}


//- (void)moveRectToPosition:(BNNRectPositionType)position {
//    if (self.animationRunning) {
//        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished) {
//            if (finished) {
//                self.rectModel.position = position;
//                [self moveRectToPosition:(self.rectModel.position + 1) % BNNRectPositionTypeCount];
//            }
//        }];
//    }
//}




@end
