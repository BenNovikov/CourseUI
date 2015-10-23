//
//  BNNArrayModel.m
//  CourseUI
//
//  Created by Home on 15/10/23.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNArrayModel.h"

#import "BNNDataModel.h"
#import "BNNDispatch.h"
#import "BNNMacros.h"

#import "NSFileManager+Extensions.h"

static NSUInteger const kBNNDefaultModelsNumber = 10;
static NSUInteger const kBNNArraySleepDuration  = 3;

@interface BNNArrayModel ()
@property (nonatomic, readonly) NSString                *fileName;
@property (nonatomic, readonly) NSString                *fileFolder;
@property (nonatomic, readonly) NSString                *filePath;
@property (nonatomic, readonly) NSArray                 *notifications;

@property (nonatomic, readonly, getter=isCached) BOOL   cached;

- (void)fillWithModels:(NSUInteger)count;

- (void)subscribeToApplicationNotifications:(NSArray *)notifications;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notifications;

@end

@implementation BNNArrayModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;
@dynamic notifications;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeFromApplicationNotifications:self.notifications];
    [self removeObserver:self];
}

- (id)init {
    self = [super init];
    if (self) {
        [self subscribeToApplicationNotifications:self.notifications];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
    return kBNNTempFileName;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSArray *)notifications {
    return @[UIApplicationWillTerminateNotification, UIApplicationWillResignActiveNotification];

}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.filePath];
}

#pragma mark -
#pragma mark Inherited Methods

- (void)performLoading {
    id block = nil;
    if (self.cached) {
        BNNSleep(kBNNArraySleepDuration);
        id objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        block = ^{
            for (id model in objects) {
                [self addModel:model];
            }
        };
    } else {
        block = ^{
            [self fillWithModels:kBNNDefaultModelsNumber];
		};
    }
    
    BNNDispatchOnMainQueue(^{
        self.state = BNNDataModelDidLoad;
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithModels:(NSUInteger)count {
    for (NSUInteger index = 0; index < count; index++) {
        [self addModel:[BNNDataModel dataModel]];
    }
}

- (void)subscribeToApplicationNotifications:(NSArray *)notifications {
    for (NSString *notification in notifications) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:notification
                                                   object:nil];
    }
}

- (void)unsubscribeFromApplicationNotifications:(NSArray *)notifications {
    for (NSString *notification in notifications) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notification
                                                      object:nil];
    }
}

#pragma mark -
#pragma mark BNNObservableModel

- (void)model:(id)model didChangeWithObject:(id)object {
    BNNLogForObject(@"%@ saved", self);
    [self save];
}

@end
