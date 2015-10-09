//
//  BNNModelStateProtocol.h
//  Course
//
//  Created by Admin on 15/08/25/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BNNModelStateProtocol <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;
- (void)modelDidChange:(id)model;

//- (void)model:(id)model didChangeWithObject:(id)object;

@end
