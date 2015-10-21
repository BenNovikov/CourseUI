//
//  BNNLoadingView.h
//  CourseUI
//
//  Created by Home on 10/18/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNView.h"

@interface BNNLoadingView : BNNView
@property (nonatomic, assign, getter = isVisible) BOOL        visible;
//@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *spinner;

+ (instancetype)viewWithSuperview:(UIView *)view;

- (instancetype)initWithSuperview:(UIView *)view NS_DESIGNATED_INITIALIZER;

- (void)setVisible:(BOOL)visible;
- (void)setVisible:(BOOL)visible withAnimation:(BOOL)animated;

@end
