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
@property (nonatomic, readonly)                         BNNRectView *rectView;
@property (nonatomic, assign, getter=isAnimationRunning) BOOL       animationRunning;

- (void)moveRectWithBlock:(BNNRectPositionType(^)(void))block;
- (void)moveRectToPosition:(BNNRectPositionType)position;
- (BNNRectPositionBlock)nextPositionBlock;

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
    self.animationRunning = ![self isAnimationRunning];
    NSLog(@"animation runnung:%d", self.animationRunning);
    if (self.animationRunning) {
        [self moveRectWithBlock:[self nextPositionBlock]];
    }
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

#pragma mark -
#pragma mark Private

- (void)moveRectWithBlock:(BNNRectPositionType(^)(void))block {
    if (self.animationRunning) {
        BNNRectPositionType position = block();
        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished){
            if (finished) {
                self.rectModel.position = position;
                [self moveRectWithBlock:block];
            }
        }];
    }
}

- (void)moveRectToPosition:(BNNRectPositionType)position {
    if (self.animationRunning) {
        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished) {
            if (finished) {
                self.rectModel.position = position;
                [self moveRectToPosition:(self.rectModel.position + 1) % BNNRectPositionTypeCount];
            }
        }];
    }
}

- (BNNRectPositionBlock)nextPositionBlock {
    BNNRectPositionBlock result = ^{
        return (self.rectModel.position + 1) % BNNRectPositionTypeCount;
    };
    
    return result;
}

@end
