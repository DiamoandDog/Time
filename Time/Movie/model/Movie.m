//
//  Movie.m
//  Time
//
//  Created by imac on 15/8/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(id)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if(self){
        //将字典里的数据读取出来 存储到属性中
       // NSLog(@"%@",dic);
        //
        NSDictionary *subDic=dic[@"subject"];
        _titleCN=subDic[@"title"];
        _titleEN=subDic[@"original_title"];
        NSDictionary *ratingDic=subDic[@"rating"];
        NSNumber *averageNumber=ratingDic[@"average"];
        _rating=[averageNumber floatValue];
        _images=subDic[@"images"];
        _year=subDic[@"year"];
    }
    return self;
}


@end
