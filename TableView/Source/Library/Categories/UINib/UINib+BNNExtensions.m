//
//  UINib+BNNExtensions.m
//  CourseUI
//
//  Created by Admin on 15/10/04/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "UINib+BNNExtensions.h"

@implementation UINib (BNNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)aClass {
    return [self nibWithClass:aClass bundle:nil];
}

+ (UINib *)nibWithClass:(Class)aClass bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(aClass) bundle:bundle];
}

+ (id)objectWithClass:(Class)aClass {
    return [[self nibWithClass:aClass] objectWithClass:aClass];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [[self nibWithClass:aClass] objectWithClass:aClass owner:owner];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner bundle:(NSBundle *)bundle {
    return [[self nibWithClass:aClass bundle:bundle] objectWithClass:aClass owner:owner];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options {
    return [[self nibWithClass:aClass] objectWithClass:aClass owner:owner options:options];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil options:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass owner:owner options:nil];
}

//- (id)objectWithClass:(Class)aClass owner:(id)owner bundle:(NSBundle *)bundle {
//    return [[UINib nibWithNibName:NSStringFromClass(aClass) bundle:bundle] objectWithClass:aClass owner:owner];
//}

- (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:nil];
    for (id object in objects) {
        if ([object isMemberOfClass:aClass]) {
            return object;
        }
    }
    
    return nil;
}

@end
