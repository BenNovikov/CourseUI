//
//  BNNArrayModel.h
//  CourseUI
//
//  Created by Home on 15/10/23.
//  Copyright (c) 2015 BenNovikov. All rights reserved.
//

#import "BNNDataArrayModel.h"
#import "BNNObservableModel.h"

@interface BNNArrayModel : BNNDataArrayModel <BNNObservableModel>

- (void)save;

@end
