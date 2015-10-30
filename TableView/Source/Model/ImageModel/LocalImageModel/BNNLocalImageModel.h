//
//  BNNLocalImageModel.h
//  CourseUI
//
//  Created by Home on 15/10/29.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNImageModel.h"

@interface BNNLocalImageModel : BNNImageModel
@property (nonatomic, readonly) NSString                *fileName;
@property (nonatomic, readonly) NSString                *fileFolder;
@property (nonatomic, readonly) NSString                *filePath;

@property (nonatomic, readonly, getter=isCached) BOOL   cached;

@end
