//
//  BNNObservableObject.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNObservableObject.h"

@implementation BNNObservableObject

#pragma mark - Initialization and Deallocation

- (id)init {
    if ((self = [super init])) {
        _observers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

- (void)dealloc {
    self.observers = nil;
}

#pragma mark - Public Methods

- (void)addObserver:(id)observer {
    @synchronized(self.observers) {
        [self.observers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self.observers) {
        [self.observers removeObject:observer];
    }
}

- (BOOL)isObserver:(id)observer {
    if (nil != observer) {
        return [self.observers containsObject:observer];
    }
    
    return NO;
}

- (void)notifyObserversWithSelector:(SEL)selector {
    for (id observer in self.observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelectorOnMainThread:selector withObject:self waitUntilDone:NO];
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelectorOnMainThread:selector withObject:object waitUntilDone:NO];
        }
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    // to be overloaded in subclasses
    return NULL;
}

@end
