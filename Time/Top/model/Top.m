//
//  Top.m
//  Time
//
//  Created by imac on 15/8/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "Top.h"

@implementation Top

-(id)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if(self){
        //将字典里的数据读取出来 存储到属性中
        // NSLog(@"%@",dic);
        
        _title=dic[@"title"];
        NSDictionary *ratingDic=dic[@"rating"];
        NSNumber *averageNumber=ratingDic[@"average"];
        _rating=[averageNumber floatValue];
        _image=dic[@"images"];
    }
    return self;
}@end
