//
//  UINib+BNNExtensions.h
//  CourseUI
//
//  Created by Admin on 15/10/04/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (BNNExtensions)

+ (UINib *)nibWithClass:(Class)aClass;
+ (UINib *)nibWithClass:(Class)aClass bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)aClass;
+ (id)objectWithClass:(Class)aClass owner:(id)owner;
+ (id)objectWithClass:(Class)aClass owner:(id)owner bundle:(NSBundle *)bundle;
+ (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options;

- (id)objectWithClass:(Class)aClass;
- (id)objectWithClass:(Class)aClass owner:(id)owner;
//- (id)objectWithClass:(Class)aClass owner:(id)owner bundle:(NSBundle *)bundle;
- (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options;


@end
