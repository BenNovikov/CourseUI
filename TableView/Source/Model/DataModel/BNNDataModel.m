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

# pragma mark - 
# pragma mark Class Methods

+ (instancetype)dataModel {
    return [[super alloc] initWithString:[NSString randomUnicodeStringWithLength:kBNNRandomStringLength]];
}

- (instancetype)initWithString:(NSString *)string {
    if((self = [super init])) {
        self.text = string;

    }
    
    return self;
}

#pragma mark - 
# pragma mark Accesors

- (BNNImageModel *)imageModel {
    static BNNImageModel *__imageModel =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __imageModel = [BNNImageModel imageFromURL:[NSURL URLWithString:kBNNImageName]];
    });
    
    return __imageModel;
}

#pragma mark - 
# pragma mark BNNAbstractDataModel

- (void)initiateLoading {
    NSLog(@"Data Model Loading Started...");
}

- (void)performLoading {
    self.state = BNNDataModelDidLoad;
}

@end
