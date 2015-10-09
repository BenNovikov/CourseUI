//
//  BNNDataViewController.m
//  TableView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//
#import <UIKit/UIKitDefines.h>

#import "BNNDataCell.h"
#import "UITableView+BNNExtensions.h"
#import "BNNDataViewController.h"
#import "BNNDataView.h"
#import "BNNMacros.h"

BNNViewControllerMainViewProperty(BNNDataViewController, dataView, BNNDataView);

@implementation BNNDataViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if(self ) {
//        
//    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(BNNDataArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        [_arrayModel removeObserver:self];
        _arrayModel = arrayModel;
        [_arrayModel addObserver:self];
    }
}

#pragma mark -
#pragma mark UI

- (IBAction)onTapAddButton:(id)sender {
    NSLog(@"Added %d row", self.arrayModel.count + 1);
    [self.arrayModel addModel:[BNNDataModel dataModel]];    
}

- (IBAction)onTapRemoveButton:(id)sender {
    NSUInteger counter = self.arrayModel.count;
    if (counter) {
        NSLog(@"Removed %d row", self.arrayModel.count);
        NSUInteger sourcePath = (NSUInteger)[[self.dataView.tableView indexPathForSelectedRow] row];
        [self.arrayModel removeModelAtIndex:sourcePath];
    }
}

- (IBAction)onTapEditButton:(id)sender {
    NSLog(@"Edit");
    BNNDataView *view = self.dataView;
    [view setEditing:![view isEditing]];
}

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.arrayModel load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BNNDataCell *cell = [tableView reusableCellWithClass:[BNNDataCell class]];
    
    cell.model = [self.arrayModel modelAtIndex:indexPath.row];
    
    return cell;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.dataView.tableView setEditing:editing animated:animated];
}

#pragma mark -
#pragma mark UITableViewDelegate protocol

@end
