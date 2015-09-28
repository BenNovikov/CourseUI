//
//  BNNRectViewController.m
//  CourseUI
//
//  Created by Admin on 15/09/11/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNRectViewController.h"
#import "BNNRectView.h"
#import "BNNRectModel.h"

@interface BNNRectViewController ()
@property (nonatomic, readonly) BNNRectView *rectView;

@end

@implementation BNNRectViewController

@dynamic rectView;

#pragma mark -
#pragma mark Accessors

- (BNNRectView *)rectView {
    if ([self isViewLoaded] && [self.view isKindOfClass:([BNNRectView class])]) {
        
        return (BNNRectView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public

- (IBAction)onAnimationButton:(id)sender {
    BNNRectView *rectView = self.rectView;
    rectView.animationRunning = !rectView.isAnimationRunning;
    
    NSLog(@"animation runnung:%d", rectView.isAnimationRunning);
}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.rectView.rectModel = self.rectModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
