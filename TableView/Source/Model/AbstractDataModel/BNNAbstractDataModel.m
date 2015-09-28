//
//  BNNAbstractDataModel.m
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNAbstractDataModel.h"

@implementation BNNAbstractDataModel

#pragma mark - Public Methods

- (void)performLoading {
    @synchronized(self) {
        NSUInteger state = self.state;
        if(BNNDataModelDidUnload == state ||
           BNNDataModelDidFailLoading == state) {
            self.state = BNNDataModelWillLoad;
            [self initiateLoading];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                [self startLoading];
            });
        } else {
            [self notifyObserversWithSelector:[self selectorForState:state]];
        }
    }
}

- (void)initiateLoading {
    // do something before loading
}

- (void)startLoading {
    // do what you need to load
}

#pragma mark - BNNObservableObject 

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
            
        default:
            return [super selectorForState:state];
    }
}

@end
