//
//  NSFileManager+Extensions.h
//  CourseUI
//
//  Created by Home on 15/10/23.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Extensions)

+ (NSString *)userDocumentsPath;

+ (NSString *)pathWithSearchPath:(NSSearchPathDirectory)directory;

+ (NSString *)pathWithSearchPath:(NSSearchPathDirectory)directory domainMask:(NSSearchPathDomainMask)domainMask;

@end
