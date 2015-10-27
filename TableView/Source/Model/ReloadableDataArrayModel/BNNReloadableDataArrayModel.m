//
//  BNNReloadableDataArrayModel.m
//  CourseUI
//
//  Created by Home on 15/10/23.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNReloadableDataArrayModel.h"

#import "BNNDataModel.h"
#import "BNNDispatch.h"
#import "BNNMacros.h"

#import "NSFileManager+Extensions.h"

static NSUInteger const kBNNDefaultModelsNumber = 10;
static NSUInteger const kBNNArraySleepDuration  = 2;

@interface BNNReloadableDataArrayModel ()
@property (nonatomic, readonly) NSString                *fileName;
@property (nonatomic, readonly) NSString                *fileFolder;
@property (nonatomic, readonly) NSString                *filePath;
@property (nonatomic, readonly) NSArray                 *notificationNames;

@property (nonatomic, readonly, getter=isCached) BOOL   cached;

- (void)fillWithModels:(NSUInteger)count;

- (void)subscribeToApplicationNotifications:(NSArray *)notifications;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notifications;

@end

@implementation BNNReloadableDataArrayModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;
@dynamic notificationNames;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeFromApplicationNotifications:self.notificationNames];
}

- (id)init {
    self = [super init];
    if (self) {
        [self subscribeToApplicationNotifications:self.notificationNames];
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

- (NSArray *)notificationNames {
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
    if (self.isCached) {
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
    
    [self performBlock:block shouldNotify:NO];
    
    BNNDispatchAsyncOnMainThread(^{
        [self performBlock:^{
            self.state = BNNDataModelDidLoad;
        }
              shouldNotify:YES];
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

//#pragma mark -
//#pragma mark BNNModelObserver
//
//- (void)modelDidChange:(id)model {
//    BNNLogForObject(@"%@ saved", model);
//    [self save];
//}
//
//- (void)model:(id)model didChangeWithObject:(id)object {
//    BNNLogForObject(@"%@ saved", self);
//    [self save];
//}

@end
