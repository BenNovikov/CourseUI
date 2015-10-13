//
//  BNNAbstractDataModelProtocol.h
//  CourseUI
//
//  Created by Home on 10/12/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNNAbstractDataModel;

@protocol BNNAbstractDataModelProtocol <NSObject>

@optional

- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

- (void)model:(id)model didChangeWithObject:(id)object;

@end
