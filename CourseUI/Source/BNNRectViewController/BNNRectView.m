//
//  BNNRectView.m
//  CourseUI
//
//  Created by Admin on 15/09/12/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNRectView.h"
#import "BNNRectView+Extensions.h"

@interface BNNRectView ()

- (CGRect)frameForPosition:(BNNRectPositionType)position;

@end

@implementation BNNRectView

#pragma mark -
#pragma mark Accessors

- (void)setRect:(BNNRectModel *)rectModel {
    if (rectModel != _rectModel) {
        _rectModel = rectModel;
    }
    
    self.rectangle.frame = [self frameForPosition:rectModel.position];
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
    CGRect frame = [self frameForPosition:position];
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.rectangle.frame = frame;
                         
                         self.rectangle.backgroundColor = [self randomColor];
//                         CGAffineTransform scale = CGAffineTransformMakeScale([self randomScale], [self randomScale]);
//                         CGAffineTransform rotation = CGAffineTransformMakeRotation([self randomRotation]);
//                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
//                         self.rectangle.transform = transform;
                     }
                     completion:^(BOOL finished){
                         if (block) {
                             block(finished);
                             self.rectModel.position = position;
                         }
                     }];
}

#pragma mark -
#pragma mark Private

// to Model
- (CGRect)frameForPosition:(BNNRectPositionType)position
{
    CGRect  frame           = self.rectangle.frame;
    CGFloat frameWidth      = frame.size.width;
    CGFloat frameHeight     = frame.size.height;
    CGRect screenBounds     = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth     = screenBounds.size.width;
    CGFloat screenHeight    = screenBounds.size.height;
    
    frame.origin.x = ((position & 1) ^ ((position & (1 << 1)) >> 1)) * (screenWidth - frameWidth);
    frame.origin.y = ((position & (1 << 1)) >> 1) * (screenHeight - frameHeight);
    
    return frame;
}

@end
