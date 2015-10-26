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
    self.loadingView.visible = YES;
}

- (void)hideLoadingView {
    self.loadingView.visible = NO;
}

@end
