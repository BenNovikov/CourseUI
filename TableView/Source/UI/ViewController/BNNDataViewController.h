//
//  BNNDataViewController.h
//  DataView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNNDataModel.h"
#import "BNNDataArrayModel.h"

@interface BNNDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   BNNDataArrayModel   *arrayModel;

- (IBAction)onTapAddButton:(id)sender;
- (IBAction)onTapEditButton:(id)sender;

@end

