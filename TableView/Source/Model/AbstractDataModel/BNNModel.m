//
//  BNNModel.m
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNModel.h"

@implementation BNNModel

#pragma mark -
#pragma mark Public Methods

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        if (BNNDataModelDidUnload == state
           || BNNDataModelDidFailLoading == state)
        {
            self.state = BNNDataModelWillLoad;
            BNNLogLoadingInitiated;
            [self initiateLoading];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [self performLoading];
            });
        } else {
            [self notifyObserversWithSelector:[self selectorForState:state]];
        }
    }
}

- (void)initiateLoading {
    /* use this in subclasses to log 
     initiateLoading in DebugMode: */
    //    BNNLogLoadingInitiated;
}

- (void)performLoading {
    /* use this in subclasses to log 
     performLoading in DebugMode: */
    //    BNNLogLoadingPerformed;
}

#pragma mark -
#pragma mark BNNObservableModel

- (SEL)selectorForState:(NSUInteger)state {
    switch(state) {
        case BNNDataModelDidUnload:
            return @selector(modelDidUnload:);
            
        case BNNDataModelWillLoad:
            return @selector(modelWillLoad:);
            
        case BNNDataModelDidLoad:
            return @selector(modelDidLoad:);
            
        case BNNDataModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        case BNNDataModelDidChange:
            return @selector(modelDidChange:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
