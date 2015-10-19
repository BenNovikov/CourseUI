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
#import "BNNMacros.h"

static NSString * const kBNNTextKey = @"text";
static NSString * const kBNNURL     = @"http://static.standard.co.uk/s3fs-public/styles/story_large/public/thumbnails/image/2015/04/15/10/griner3.jpg";

@interface BNNDataModel()
@property(nonatomic, assign)  BNNImageModel   *imageModel;

@end

@implementation BNNDataModel

# pragma mark - 
# pragma mark Class Methods

+ (instancetype)dataModel {
    return [[self alloc] initWithString:[NSString randomUnicodeStringWithLength:kBNNRandomStringLength]];
}

- (instancetype)initWithString:(NSString *)string {
    if((self = [super init])) {
        self.text = string;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (BNNImageModel *)imageModel {
    self.state = BNNDataModelWillLoad;
    BNNImageModel *imageModel = [BNNImageModel imageFromURL:[NSURL URLWithString:kBNNImageName]];
    self.state = imageModel ? BNNDataModelDidLoad : BNNDataModelDidFailLoading;
//    NSLog(@"Data Model state: %lu", self.state);
    
    return imageModel;
}

#pragma mark -
#pragma mark BNNModel

- (void)initiateLoading {
    NSLog(@"Data Model Loading Started...");
    self.state = BNNDataModelWillLoad;
}

- (void)performLoading {
    self.state = BNNDataModelDidLoad;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.text forKey:kBNNTextKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:kBNNTextKey];
    }
    
    return self;
}

@end
