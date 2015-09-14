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
@property (nonatomic, readonly)                 BNNRectView *rectView;
@property (nonatomic, assign, getter=isRunning) BOOL        running;

- (void)moveRectWithBlock:(BNNRectPositionType(^)(void))block;
- (void)moveRectTo:(BNNRectPositionType)position;
- (BNNRectPositionBlock)nextPositionBlock;

@end

@implementation BNNRectViewController

@dynamic rectView;

#pragma mark -
#pragma mark Accessors

- (BNNRectView *)rectView {
    if ([self isViewLoaded] && [self.view isKindOfClass:([BNNRectView class])]) {
        NSLog(@"[self.view isKindOfClass:([BNNRectView class])]:%d", [self.view isKindOfClass:([BNNRectView class])]);
        
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

- (IBAction)onClickStartButton:(id)sender {
    self.running = ![self isRunning];
    NSLog(@"runnung:%d", self.running);
    if (self.running) {
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
    if (self.running) {
        BNNRectPositionType position = block();
        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished){
            if (finished) {
                self.rectModel.position = position;
                [self moveRectWithBlock:block];
            }
        }];
    }
}

- (void)moveRectTo:(BNNRectPositionType)position {
    if (self.running) {
        [self.rectView setRectPosition:position animated:YES completion:^(BOOL finished) {
            if (finished) {
                self.rectModel.position = position;
                [self moveRectTo:(self.rectModel.position + 1) % BNNRectPositionTypeCount];
            }
        }];
    }
}

// to Model
- (BNNRectPositionBlock)nextPositionBlock {
    BNNRectPositionBlock result = ^{
        return (self.rectModel.position + 1) % BNNRectPositionTypeCount;
    };
    
    return result;
}


@end
