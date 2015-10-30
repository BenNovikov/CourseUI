//
//  BNNLocalImageModel.m
//  CourseUI
//
//  Created by Home on 15/10/29.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNLocalImageModel.h"

#import "NSFileManager+Extensions.h"

@implementation BNNLocalImageModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
    NSString *name = [self.url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    BNNLogForObject(@"fileName: %@", name);
    
    return name;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}



@end
