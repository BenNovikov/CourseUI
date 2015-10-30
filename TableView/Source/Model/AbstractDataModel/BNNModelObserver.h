//
//  BNNModelObserver.h
//  CourseUI
//
//  Created by Home on 15/10/22.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

@class BNNDataArrayModelChanges;
@class BNNFileDataArrayModel;

@protocol BNNModelObserver <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

- (void)model:(BNNFileDataArrayModel *)model didChangeWithObject:(BNNDataArrayModelChanges *)changes;

@end
