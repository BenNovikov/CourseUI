//
//  BNNDataView.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataView.h"

static NSString * const kBNNEditButtonTitleEdit = @"Edit";
static NSString * const kBNNEditButtonTitleDone = @"Done";

@interface BNNDataView ()

- (void)changeEditButtonTitle;

@end

@implementation BNNDataView

@dynamic editing;

#pragma mark -
#pragma mark Accessors

- (BOOL)isEditing {
    return self.tableView.editing;
}

- (void)setEditing:(BOOL)editing {
    [self.tableView setEditing:editing animated:YES];
    [self changeEditButtonTitle];
}

#pragma mark -
#pragma mark Private

- (void)changeEditButtonTitle {
    NSString *title = self.editing ? kBNNEditButtonTitleDone : kBNNEditButtonTitleEdit;
    [self.editButton setTitle:title forState:UIControlStateNormal];
}

@end
