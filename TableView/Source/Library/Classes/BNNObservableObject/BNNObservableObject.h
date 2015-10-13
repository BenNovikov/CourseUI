//
//  BNNObservableObject.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNNModelStateProtocol.h"

@interface BNNObservableObject : NSObject
@property (nonatomic, readonly) NSSet       *observerSet;
@property (atomic, assign)      NSUInteger  state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (SEL)selectorForState:(NSUInteger)state;
- (void)setState:(NSUInteger)state withObject:(id)object;

@end
