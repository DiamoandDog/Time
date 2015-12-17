//
//  Top.h
//  Time
//
//  Created by imac on 15/8/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
#define TopImageSmallKey @"small"
@interface Top : BaseModel
@property (nonatomic, strong) NSDictionary *image;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)CGFloat rating;

-(id)initWithDictionary:(NSDictionary *)dic;
@end
