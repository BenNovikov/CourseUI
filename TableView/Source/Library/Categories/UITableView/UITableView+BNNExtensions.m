//
//  UITableView+BNNExtensions.m
//  CourseUI
//
//  Created by Admin on 15/09/30/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelChanges.h"
#import "BNNDataArrayModelChangingPaths.h"

#import "UITableView+BNNExtensions.h"
#import "UINib+BNNExtensions.h"

@implementation UITableView (BNNExtensions)

#pragma mark -
#pragma mark Public Methods

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateWithChanges:(BNNDataArrayModelChanges *)changes {
    UITableView *tableView = self;
    NSIndexPath *destination = changes.paths.destinationPath;
    
    [tableView beginUpdates];
    
    switch (changes.state) {
        case BNNDataArrayModelInsert:
            [tableView insertRowsAtIndexPaths:@[destination] withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        case BNNDataArrayModelMove:
            [tableView moveRowAtIndexPath:changes.paths.sourcePath toIndexPath:destination];
            break;
            
        case BNNDataArrayModelDelete:
            [tableView deleteRowsAtIndexPaths:@[destination] withRowAnimation:UITableViewRowAnimationRight];
            break;
            
        default:
            break;
    }
    
    [tableView endUpdates];
}

@end
