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
@property (nonatomic, strong)                   BNNLoadingView  *loadingView;
@property (nonatomic, assign, getter=isVisible) BOOL            visible;

@end

@implementation BNNView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.loadingView = [BNNLoadingView viewWithSuperview:self];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.loadingView = [BNNLoadingView viewWithSuperview:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (BNNLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [BNNLoadingView viewWithSuperview:self];
    }
    
    return _loadingView;
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self bringSubviewToFront:self.loadingView];
    [self.loadingView setVisible:YES];
}

- (void)hideLoadingView {
    BNNLoadingView *view = self.loadingView;
    [view setVisible:NO];
    [view removeFromSuperview];
}

- (BOOL)isLoadingViewVisible {
    return self.loadingView.visible;
}

@end
