//
//  UITableView+BNNExtensions.m
//  CourseUI
//
//  Created by Admin on 15/09/30/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelModification.h"

#import "UITableView+BNNExtensions.h"
#import "UINib+BNNExtensions.h"

@implementation UITableView (BNNExtensions)

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateWithModification:(id)modification {
    
}

- (void)updateWithSourcePaths:(NSIndexPath *)sourcePath destinationPath:(NSIndexPath *)destinationPath {
    UITableView *tableView = self;
    
    [tableView beginUpdates];
    
    if (sourcePath) {
        if (destinationPath) {
            [tableView moveRowAtIndexPath:sourcePath toIndexPath:destinationPath];
        } else {
            [tableView deleteRowsAtIndexPaths:@[sourcePath] withRowAnimation:UITableViewRowAnimationRight];
        }
    } else if (destinationPath) {
        [tableView insertRowsAtIndexPaths:@[destinationPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    [tableView endUpdates];
}

@end
