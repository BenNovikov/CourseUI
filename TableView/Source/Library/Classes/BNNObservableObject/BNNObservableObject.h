//
//  BNNObservableObject.h
//  Course
//
//  Created by Admin on 15/08/23/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNNObservableObject : NSObject
@property (nonatomic, readonly) NSSet       *observerSet;
@property (nonatomic, assign)   NSUInteger  state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (SEL)selectorForState:(NSUInteger)state;
//- (void)setState:(NSUInteger)state;
- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify;

@end
