//
//  BNNLoadingView.m
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNLoadingView.h"

#import "UINib+BNNExtensions.h"

@implementation BNNLoadingView

@synthesize visible = _visible;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewWithSuperview:(UIView *)superview {
    return [[self alloc] initWithSuperview:superview];
}

- (instancetype)initWithSuperview:(UIView *)superview {
    self = [super initWithFrame:[superview frame]];
    if (self) {
        self = [UINib objectWithClass:[self class]];
        
        [superview addSubview:self];
        self.frame = superview.bounds;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible withAnimation:YES];
}

- (void)setVisible:(BOOL)visible withAnimation:(BOOL)animated {
    [UIView animateWithDuration:kBNNAnimationDuration animations:^{
        self.alpha = visible ? kBNNVisibleAlpha : kBNNInvisibleAlpha;
    } completion:^(BOOL finished) {
        if (finished) {
            _visible = visible;
        }
    }];
}

@end
