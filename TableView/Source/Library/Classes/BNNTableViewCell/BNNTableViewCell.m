//
//  BNNTableViewCell.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNTableViewCell.h"

@implementation BNNTableViewCell

#pragma mark -
#pragma mark Accessor

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
