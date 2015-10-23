//
//  NSFileManager+Extensions.m
//  CourseUI
//
//  Created by Home on 15/10/23.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "NSFileManager+Extensions.h"

@implementation NSFileManager (Extensions)

+ (NSString *)userDocumentsPath {
    return [self pathWithSearchPath:NSDocumentDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPath:(NSSearchPathDirectory)directory {
    return [self pathWithSearchPath:directory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPath:(NSSearchPathDirectory)directory domainMask:(NSSearchPathDomainMask)domainMask {
    return [NSSearchPathForDirectoriesInDomains(directory, domainMask, YES) firstObject];
}

@end
