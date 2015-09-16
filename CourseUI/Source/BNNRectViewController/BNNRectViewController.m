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
@property (nonatomic, readonly)                             BNNRectView *rectView;
@property (nonatomic, assign, getter=isAnimationRunning)    BOOL        animationRunning;

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

- (void)setRect:(BNNRectModel *)rectModel {
    if (rectModel != _rectModel) {
        _rectModel = rectModel;
    }
    
    self.rectView.rectModel = rectModel;
}

#pragma mark -
#pragma mark Public

- (IBAction)onAnimationButton:(id)sender {
    self.animationRunning = !self.isAnimationRunning;
    NSLog(@"animation runnung:%d", self.animationRunning);
    
//    if (self.animationRunning) {
//        [self.rectView moveRectWithBlock:[self.rectView.rectModel nextPosition]];
//    }
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
