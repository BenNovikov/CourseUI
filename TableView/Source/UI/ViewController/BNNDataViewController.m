//
//  BNNDataViewController.m
//  TableView
//
//  Created by Admin on 15/09/26/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//
#import <UIKit/UIKitDefines.h>

#import "BNNDataViewController.h"

#import "BNNDataCell.h"
#import "BNNDataView.h"
#import "BNNDataModel.h"
#import "BNNDataArrayModel.h"
#import "BNNDataArrayModelChanges.h"

#import "UITableView+BNNExtensions.h"
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

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(BNNDataArrayModel *)arrayModel {
    BNNSynthesizeObservableSetterAndExecuteMethod(arrayModel, load);
}

#pragma mark -
#pragma mark UI

- (IBAction)onTapAddButton:(id)sender {
    [self.arrayModel addModel:[BNNDataModel dataModel]];
}

- (IBAction)onTapEditButton:(id)sender {
    BNNDataView *view = self.dataView;
    [view setEditing:![view isEditing]];
}

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.arrayModel load];
    
    BNNLogForObject(@"arrayModel:%@", self.arrayModel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
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
    
    [self.dataView.tableView reloadData];
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.arrayModel moveModelAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeModelAtIndex:indexPath.row];
    }
}

#pragma mark -
#pragma mark UITableViewDelegate 

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark BNNModelObserver

- (void)modelWillLoad:(id)model {
    self.dataView.loadingView.visible = YES;
    BNNLogForObject(@"modelWillLoad:%@", model);
}

- (void)modelDidLoad:(id)model {
    BNNDataView *view = self.dataView;
    
    view.loadingView.visible = NO;
    BNNLogForObject(@"modelDidLoad:%@", model);
    
    [self.dataView.tableView reloadData];
}

- (void)model:(id)model didChangeWithObject:(id)changes {
    BNNLogForObject(@"modelDidChange:%@", changes);
    [self.dataView.tableView updateWithChanges:changes];
}

@end
