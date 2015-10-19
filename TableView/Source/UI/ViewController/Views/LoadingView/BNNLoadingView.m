//
//  BNNLoadingView.m
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNLoadingView.h"

#import "UINib+BNNExtensions.h"

static NSTimeInterval const kBNNDuration    = 2.0f;
static CGFloat const kBNNVisibleAlpha       = 0.7f;
static CGFloat const kBNNInvisibleAlpha     = 0.0f;

@interface BNNLoadingView()
@property (nonatomic, assign, getter=isVisible) BOOL    visible;

@end

@implementation BNNLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewWithSuperview:(UIView *)view {
    return [[self alloc] initWithSuperview:view];
}

- (instancetype)initWithSuperview:(UIView *)view {
    self = [super init];
    if (self) {
        self = [UINib objectWithClass:[self class]];
        
        [view addSubview:self];
        self.frame = view.bounds;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible withAnimation:YES];
}

#pragma mark -
#pragma mark Public Methods

- (void)setVisible:(BOOL)visible withAnimation:(BOOL)animated {
    [UIView animateWithDuration:kBNNDuration animations:^{
        self.alpha = visible ? kBNNVisibleAlpha : kBNNInvisibleAlpha;
    } completion:^(BOOL finished) {
        if (finished) {
            self.visible = visible;
        }
    }];
    
}

@end
