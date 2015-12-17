//
//  News.m
//  Time
//
//  Created by imac on 15/8/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "News.h"

@implementation News
// 重写 initContentWithDic 方法 来读取属性名和key不同的数据
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    // 调用父类方法
    self = [super initContentWithDic:jsonDic];
    if (self)
    {
        // 手动读取 属性名和key不同的数据
        self.newsID = jsonDic[@"id"];
    }
    
    return self;
}
@end
