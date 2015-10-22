//
//  BNNMacros.h
//  CourseUI
//
//  Created by Home on 10/8/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNConstants.h"

#define BNNDefineMainViewProperty(propertyName, class) \
    @property (nonatomic, readonly) class   *propertyName

#define BNNViewGetterSynthesize(selector, viewClass) \
    - (viewClass *) selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    } 

#define BNNViewControllerMainViewProperty(viewControllerClass, propertyName, viewClass) \
    @interface viewControllerClass (__##viewClass##_##propertyName) \
    BNNDefineMainViewProperty(propertyName, viewClass); \
    \
    @end \
    \
    @implementation viewControllerClass (__##viewClass##_##propertyName) \
    \
    @dynamic propertyName; \
    \
    BNNViewGetterSynthesize(propertyName, viewClass) \
    \
    @end

// use BNNWeakify(var) and BNNStrongify(var) to the same object
#define BNNWeakify(var) \
    __weak __typeof(var) __BNNWeakified_##var = var

#define BNNStrongify(var) \
    __strong __typeof(var) var = __BNNWeakified_##var

#define BNNEmpty

#define BNNStrongifyAndReturnIfNil(var) \
    BNNStrongifyAndReturnResultIfNil(var, BNNEmpty)

#define BNNStrongifyAndReturnNilIfNil(var) \
    BNNStrongifyAndReturnResultIfNil(var, result)

#define BNNStrongifyAndReturnResultIfNil(var, result) \
    BNNStrongify(var); \
    if (!var) { \
        return result; \
    }

#define BNNSynthesizeObservableSetterAndExecuteMethod(property, method) \
    BNNSynthesizeObservableSetter(property); \
    [_##property method]

#define BNNSynthesizeObservableSetter(property) \
    if (_##property != property) { \
        [_##property removeObserver:self]; \
        _##property = property; \
        [_##property addObserver:self]; \
    }

#define BNNSynthesizeEncoderForProperty(property) \
    [coder encodeObject:self.property forKey:NSStringFromClass([self class])];

#define BNNSynthesizeDecoderForProperty(property) \
    self = [super init]; \
    if (self) { \
        self.property = [coder decodeObjectForKey:NSStringFromClass([self class])]; \
    } \
    \
    return self;

// Debug Loggers

#if BNNDebugMode
    #define BNNSleep(time) do { \
        if (time < kBNNSleepDuration) { \
            [NSThread sleepForTimeInterval:time]; \
        } else { \
            [NSThread sleepForTimeInterval:kBNNSleepDuration]; \
        } \
    } while(0)
#else
    #define BNNSleep
#endif

#if BNNDebugMode
    #define BNNLogLoadingInitiated NSLog(@"%@ Load Initiated", [self class])
#else
    #define BNNLogLoadingInitiated
#endif

#if BNNDebugMode
    #define BNNLogLoadingPerformed \
    NSLog(@"%@ Load Performed with State:%@", [self class], NSStringFromSelector([self selectorForState:self.state]))
#else
    #define BNNLogLoadingPerformed
#endif

#if BNNDebugMode
#define BNNLogForObject(log, object) \
    NSLog(@"%@ :%@", log, object)
#else
    #define BNNLogForObject
#endif

