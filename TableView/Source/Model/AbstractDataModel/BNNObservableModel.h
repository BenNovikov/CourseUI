//
//  BNNObservableModel.h
//  CourseUI
//
//  Created by Home on 15/10/22.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

@protocol BNNObservableModel <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;
- (void)modelDidChange:(id)model;

- (void)model:(id)model didChangeWithObject:(id)object;

@end
