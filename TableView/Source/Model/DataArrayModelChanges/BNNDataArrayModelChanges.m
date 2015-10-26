//
//  BNNDataArrayModelChanges.m
//  CourseUI
//
//  Created by Home on 10/7/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModelChanges.h"

@interface BNNDataArrayModelChanges ()
@property (nonatomic, assign) BNNDataArrayModelChangesState     state;
@property (nonatomic, strong) BNNDataArrayModelChangingPaths    *paths;

@end

@implementation BNNDataArrayModelChanges

#pragma mark -
#pragma mark Class Methods

+ (instancetype)changesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state {
    return [[self alloc] initChangesWithPaths:paths withState:state];
}

+ (instancetype)changesWithIndicesSource:(NSUInteger)sourceIndex
                             destination:(NSUInteger)destinationIndex
                               withState:(NSUInteger)state
{
    return [self changesWithPaths:[BNNDataArrayModelChangingPaths movingFromIndex:sourceIndex
                                                                          toIndex:destinationIndex]
                        withState:state];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initChangesWithPaths:(BNNDataArrayModelChangingPaths *)paths withState:(NSUInteger)state {
    self = [super init];
    if (self) {
        self.paths = paths;
        self.state = state;
    }
    
    return self;
}

//move to changingPaths
- (void)applyToTableView:(UITableView *)tableView {
    switch (self.state) {
        case BNNDataArrayModelInsert:
            [tableView insertRowsAtIndexPaths:@[self.paths.destinationPath]
                             withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        case BNNDataArrayModelMove:
            [tableView moveRowAtIndexPath:self.paths.sourcePath
                              toIndexPath:self.paths.destinationPath];
            break;
            
        case BNNDataArrayModelDelete:
            [tableView deleteRowsAtIndexPaths:@[self.paths.destinationPath]
                             withRowAnimation:UITableViewRowAnimationRight];
            break;
            
        default:
            break;
    }
}

@end
