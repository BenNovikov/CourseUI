//
//  BNNLoadingView.m
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNLoadingView.h"

#import "UINib+BNNExtensions.h"

@interface BNNLoadingView()
@property (nonatomic, assign, getter=isVisible) BOOL    visible;

@end

@implementation BNNLoadingView

@dynamic visible;

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
#pragma mark BNNView

- (void)setVisible:(BOOL)visible {
//    [self setVisible:visible withAnimation:YES];
}

- (void)setVisible:(BOOL)visible withAnimation:(BOOL)animated {
//    [UIView animateWithDuration:kBNNAnimationDuration animations:^{
//        self.alpha = visible ? kBNNVisibleAlpha : kBNNInvisibleAlpha;
//    } completion:^(BOOL finished) {
//        if (finished) {
//            _visible = visible;
//        }
//    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.visible = NO;
}

@end
