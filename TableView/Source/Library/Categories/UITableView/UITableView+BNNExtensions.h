//
//  UITableView+BNNExtensions.h
//  CourseUI
//
//  Created by Admin on 15/09/30/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (BNNExtensions)

- (id)reusableCellWithClass:(Class)cls;

- (void)updateWithModification:(id)modification;

@end
