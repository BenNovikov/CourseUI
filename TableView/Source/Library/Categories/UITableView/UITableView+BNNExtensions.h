//
//  UITableView+BNNExtensions.h
//  CourseUI
//
//  Created by Admin on 15/09/30/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNNDataArrayModelChanges;

@interface UITableView (BNNExtensions)

- (id)reusableCellWithClass:(Class)cls;

- (void)updateWithChanges:(BNNDataArrayModelChanges *)changes;

@end
