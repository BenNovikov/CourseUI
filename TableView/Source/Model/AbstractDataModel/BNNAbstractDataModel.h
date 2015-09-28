//
//  BNNAbstractDataModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNObservableObject.h"

typedef NS_ENUM(NSUInteger, BNNDataModelState) {
    BNNDataModelDidUnload, //is it better to call it ...IsUnload ?
    BNNDataModelWillLoad,
    BNNDataModelDidLoad,
    BNNDataModelDidFailLoading
};

@interface BNNAbstractDataModel : BNNObservableObject

- (void)performLoading;
- (void)initiateLoading;    //does nothing until reloaded in subclasses
- (void)startLoading;       //does nothing until reloaded in subclasses

@end
