//
//  BNNAbstractDataModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNObservableObject.h"

typedef NS_ENUM(NSUInteger, BNNDataModelState) {
    BNNDataModelDidUnload, 
    BNNDataModelWillLoad,
    BNNDataModelDidLoad,
    BNNDataModelDidFailLoading,    
    BNNDataModelDidChange
};

@interface BNNAbstractDataModel : BNNObservableObject

- (void)load;
- (void)initiateLoading;    //does nothing until reloaded in subclasses
- (void)performLoading;     //does nothing until reloaded in subclasses

@end
