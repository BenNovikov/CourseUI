//
//  BNNMacros.h
//  CourseUI
//
//  Created by Home on 10/8/15.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#ifndef CourseUI_BNNMacros_h
#define CourseUI_BNNMacros_h

#define BNNDefineMainViewProperty(propertyName, class) \
    @property (nonatomic, readonly) class   *propertyName;

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
    BNNDefineMainViewProperty(propertyName, viewClass) \
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

//use in pair
    #define BNNWeakify(var) \
        __weak__typeof(var) __BNNWeakified_##var = var

    #define BNNStrongify(var) \
        __strong__typeof(var) var = __BNNWeakified_##var

#define BNNStrongifyAndReturnNilIfNil(var) \
    BNNStrongifyAndReturnResultIfNil(var, nil)

#define BNNStrongifyAndReturnResultIfNil(var, result) \
    BNNStrongify(var); \
    if (!var) { \
        return result; \
    }

#define BNNSetObservableVarToField(var) \
    if (_##var != var) { \
        [_##var removeObserver:self]; \
        _##var = var; \
        [_##var addObserver:self]; \
    }

#endif
