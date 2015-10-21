//
//  BNNView.m
//  CourseUI
//
//  Created by Home on 15/10/21.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNView.h"
#import "BNNLoadingView.h"

@interface BNNView()
@property (nonatomic, assign, getter=isVisible) BOOL    visible;

@end

@implementation BNNView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];

//    BNNLoadingView *spinnerView = [[BNNLoadingView alloc] initWithSuperview:self];
    
//    self.loadingView = spinnerView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
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
    [UIView animateWithDuration:kBNNAnimationDuration animations:^{
        self.alpha = visible ? kBNNVisibleAlpha : kBNNInvisibleAlpha;
    } completion:^(BOOL finished) {
        if (finished) {
            _visible = visible;
        }
    }];
}

@end
