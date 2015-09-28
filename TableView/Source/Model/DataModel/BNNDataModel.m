//
//  BNNDataModel.m
//  CourseUI
//
//  Created by Admin on 15/09/27/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataModel.h"
#import "NSString+BNNExtensions.h"
#import "BNNTableConstants.h"

@implementation BNNDataModel

# pragma mark - Class Methods

+ (instancetype)dataModel {
    return [[super alloc] initWithString:[NSString randomUnicodeStringWithLength:kBNNRandomStringLength]];
}

- (instancetype)initWithString:(NSString *)string {
    if((self = [super init])) {
        self.text = string;
    }
    
    return self;
}

#pragma mark - Accesors

- (BNNImageModel *)imageModel {
    return [BNNImageModel imageFromURL:[NSURL initWithString:kBNNImageName]];
}

#pragma mark - BNNAbstractDataModel

- (void)initiateLoading {
    NSLog(@"Data Model Loading Started...");
}

- (void)startLoading {
    self.state = BNNDataModelDidLoad;
}

@end
