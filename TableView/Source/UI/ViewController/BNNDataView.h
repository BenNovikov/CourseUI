//
//  BNNDataView.h
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNNDataView : UIView
@property (nonatomic, strong)   IBOutlet    UITableView *tableView;
@property (nonatomic, strong)   IBOutlet    UIButton    *addButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *removeButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *editButton;
@property (nonatomic, getter=isEditing)     BOOL        editing;

- (void)setEditing:(BOOL)editing;

@end
