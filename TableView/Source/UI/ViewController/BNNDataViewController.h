//
//  BNNDataViewController.h
//  DataView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNObservableModel.h"

@class BNNDataArrayModel;

@interface BNNDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, BNNObservableModel>
@property (nonatomic, strong)   BNNDataArrayModel   *arrayModel;

- (IBAction)onTapAddButton:(id)sender;
- (IBAction)onTapEditButton:(id)sender;

@end

