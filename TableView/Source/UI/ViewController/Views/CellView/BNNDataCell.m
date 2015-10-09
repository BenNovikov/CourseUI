//
//  BNNDataCell.m
//  CourseUI
//
//  Created by Admin on 15/09/29/.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataCell.h"
#import "BNNDataModel.h"

@implementation BNNDataCell

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(BNNDataModel *)model {
    if (_model != model) {
        _model = model;
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(BNNDataModel *)model {
    self.dataTextLabel.text = model.text;
    self.dataImageView.image = model.imageModel.image;
    
//    static dispatch_once_t once_Token;
//    static dispatch_queue_t queue = nil;
//    dispatch_once(&once_Token, ^{
//        queue = dispatch_queue_create("label", DISPATCH_QUEUE_SERIAL);
//    });
//    
//    dispatch_async(queue, ^{
//        UIImage *image = model.imageModel.image;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dataImageView.image = image;
//        });
//    });
}

@end
