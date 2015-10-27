//
//  BNNModel.h
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNObservableObject.h"
#import "BNNDispatch.h"
#import "BNNMacros.h"

typedef NS_ENUM(NSUInteger, BNNDataModelState) {
    BNNDataModelDidUnload, 
    BNNDataModelWillLoad,
    BNNDataModelDidLoad,
    BNNDataModelDidFailLoading,    
    BNNDataModelDidChange
};

@interface BNNModel : BNNObservableObject

- (void)load;
- (void)initiateLoading;    //does nothing until reloaded
- (void)performLoading;     //does nothing until reloaded, notify with state in your subclass

@end
