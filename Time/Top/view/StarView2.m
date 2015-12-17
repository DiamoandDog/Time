//
//  StarView2.m
//  Time
//
//  Created by imac on 15/8/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "StarView2.h"
@interface StarView2()
{
    UIView *_grayStar;
    UIView *_yellowStar;
}

@end
@implementation StarView2




-(void)_creatViews{
    
    //创建灰色的星星
    _grayStar=[[UIView alloc]initWithFrame:CGRectMake(0, 7, 78, 19)];
    [self addSubview:_grayStar];
    _grayStar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
    
    //创建黄色星星
    _yellowStar=[[UIView alloc]initWithFrame:CGRectMake(0, 7, 78, 19)];
    [self addSubview:_yellowStar];
    _yellowStar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow@2x"]];
    //使用transform对星星进行缩放，使其大小和父视图一样
    CGFloat scale= 16/ 17.5 ;
    CGAffineTransform transform=CGAffineTransformMakeScale(scale, scale);
    //惊醒缩放
    _grayStar.transform=transform;
     _yellowStar.transform=transform;
    //让位置和大小变换后的视图，重新移动到原来的位置上去
    _grayStar.frame=self.bounds;
    
    _yellowStar.frame=self.bounds;
}

-(void)setRating:(CGFloat)rating{
    
    //判断输入的值是否合法
    if(rating<0||rating>10){
        return;
    }
    //改变黄色视图的宽度
    _yellowStar.width=_grayStar.width * rating / 10;
}
@end
