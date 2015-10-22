//
//  BNNView.h
//  CourseUI
//
//  Created by Home on 15/10/21.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNMacros.h"

@class BNNLoadingView;

@interface BNNView : UIView
@property (nonatomic, readonly)                     BNNLoadingView  *loadingView;
@property (nonatomic, readonly, getter = isVisible) BOOL            visible;

//- (instancetype)initWithFrame:(CGRect)frame;
//- (instancetype)initWithCoder:(NSCoder *)aDecoder;

- (void)showLoadingView;
- (void)hideLoadingView;
//- (BOOL)isLoadingViewVisible;

//- (BNNLoadingView *)newLoadingView;

@end
