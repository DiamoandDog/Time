//
//  News.h
//  Time
//
//  Created by imac on 15/8/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface News : BaseModel
@property (nonatomic, strong) NSNumber *newsID;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *image;
@end
