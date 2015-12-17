//
//  Movie.h
//  Time
//
//  Created by imac on 15/8/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MovieImageSmallKey @"small"
#define MovieImageLargeKey @"large"
#define MovieImageMediumKey @"medium"

@interface Movie : NSObject

@property(nonatomic,strong)NSString *titleCN;//中文名
@property(nonatomic,strong)NSString *titleEN;
@property(nonatomic,strong)NSString *year;
@property(nonatomic,assign)CGFloat rating;//评分
@property(nonatomic,strong)NSDictionary *images;


-(id)initWithDictionary:(NSDictionary *)dic;
@end
