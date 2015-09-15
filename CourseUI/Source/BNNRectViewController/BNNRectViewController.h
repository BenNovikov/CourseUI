//
//  BNNRectViewController.h
//  CourseUI
//
//  Created by Admin on 15/09/11/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNRectModel.h"

@interface BNNRectViewController : UIViewController
@property (nonatomic, strong) BNNRectModel *rectModel;

- (IBAction)onAnimationButton:(id)sender;

@end

