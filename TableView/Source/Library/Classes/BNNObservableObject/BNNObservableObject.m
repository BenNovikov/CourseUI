//
//  BNNObservableObject.m
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNObservableObject.h"

#import "BNNDispatch.h"
#import "BNNMacros.h"

@interface BNNObservableObject ()
@property (nonatomic, strong)   NSHashTable *observers;

@end

@implementation BNNObservableObject

@dynamic observerSet;

#pragma mark -
#pragma mark Initialization and Deallocation

- (id)init {
    self = [super init];
    if (self) {
        self.observers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

- (void)dealloc {
    self.observers = nil;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observerSet {
    @synchronized(self) {
        return [self.observers copy];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    @synchronized(self) {
        [self.observers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
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
//            [observer performSelectorOnMainThread:selector withObject:self waitUntilDone:NO];
            BNNDispatchOnMainQueue(^{
                [observer performSelector:selector withObject:self];
            });
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.observers) {
        if ([observer respondsToSelector:selector]) {
//            [observer performSelectorOnMainThread:selector withObject:object waitUntilDone:NO];
            BNNDispatchOnMainQueue(^{
                [observer performSelector:selector withObject:object];
            });
        }
    }
}

//don't look at this mess, anyway it doesn't work as i'd like 
//- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object1 withObject:(id)object2 {
//    for (id observer in self.observers) {
//        if ([observer respondsToSelector:selector]) {
//            BNNDispatchOnMainQueue(^{
//                BNNLogForObject(@"selector:%@", NSStringFromSelector(selector));
//                BNNLogForObject(@"object1:%@", self);
//                BNNLogForObject(@"object2:%@", object2);
//                
//                [observer performSelector:selector withObject:self withObject:object2];
//            });
//        }
//    }
//}

- (SEL)selectorForState:(NSUInteger)state {
    // to be overloaded in subclasses
    return NULL;
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        self.state = state;
        
        [self notifyObserversWithSelector:[self selectorForState:_state] withObject:object];
    }
}

@end
