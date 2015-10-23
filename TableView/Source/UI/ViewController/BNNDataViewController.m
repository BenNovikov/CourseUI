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
//#import "BNNDataArrayModelChanges.h"

#import "UITableView+BNNExtensions.h"
#import "BNNMacros.h"

//static double const BNNOnTapDelayInSeconds = 0.2;

BNNViewControllerMainViewProperty(BNNDataViewController, dataView, BNNDataView);

@implementation BNNDataViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }

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
 
//    They say there is no need to control double taps. So let it be cleaned away, a bit later.
//
//    UIApplication *sharedApp = [UIApplication sharedApplication];
//    [sharedApp beginIgnoringInteractionEvents];
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * BNNOnTapDelayInSeconds));
//    dispatch_after(time, dispatch_get_main_queue(), ^(void) {
//        if ([sharedApp isIgnoringInteractionEvents]) {
//            [sharedApp endIgnoringInteractionEvents];
//        }
//    });
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
//    BOOL insertable = (0 == indexPath.row || indexPath.row == self.arrayModel.count - 1);
//    return insertable ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
    
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark BNNObservableModel

- (void)modelDidUnload:(id)model {
}

- (void)modelWillLoad:(id)model {
    BNNLogForObject(@"modelWillLoad:%@", model);
    self.dataView.loadingView.visible = YES;
}

- (void)modelDidLoad:(id)model {
    BNNDataView *view = self.dataView;
    [view.tableView reloadData];
    view.loadingView.visible = NO;
    BNNLogForObject(@"modelDidLoad:%@", model);
}

- (void)modelDidChange:(id)changes {
    BNNLogForObject(@"modelDidChange:%@", changes);
    [self.dataView.tableView updateWithChanges:changes];
    
    /*
     *  this helps to reload image but this way sucks!
     */
//    [self.dataView.tableView reloadData];
}

- (void)model:(BNNDataArrayModel *)modelArray didChangeWithObject:(BNNDataArrayModelChanges *)changes {
    BNNLogForObject(@"model didChangeWithObject: %@", changes);
    [self.dataView.tableView updateWithChanges:changes];
}

@end
