//
//  Comment.h
//  Time
//
//  Created by imac on 15/8/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface Comment : BaseModel
@property(nonatomic,copy)NSString *userImage;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString  *rating;
@end
