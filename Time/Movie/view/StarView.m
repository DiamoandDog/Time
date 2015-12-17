//
//  StarView.m
//  Time
//
//  Created by imac on 15/8/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "StarView.h"
@interface StarView()
{

    UIView *_grayStar;
    UIView *_yellowStar;
}
@end
@implementation StarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//initWithFrame方法在从xib文件中读取时 是不会调用的
-(instancetype)initWithFrame:(CGRect)frame
{
    //强制让视图的宽高成比例，能够完整显示五颗星
    CGFloat width=frame.size.height / 17 * 17.5 * 5;
    frame.size.width=width;
    
    self=[super initWithFrame:frame];
    if(self){
        [self _creatViews];
    }
    return self;
}
//从xib文件中创建view时，所调用的方法
-(void)awakeFromNib{
    //强制让视图的宽高成比例，能够完整显示五颗星
    CGFloat width=self.frame.size.height / 17 * 17.5 * 5;
    self.width=width;
    [self _creatViews];
}

-(void)_creatViews{

    //创建灰色的星星
    _grayStar=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    [self addSubview:_grayStar];
    _grayStar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
    
    //创建黄色星星
    _yellowStar=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    [self addSubview:_yellowStar];
    _yellowStar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow@2x"]];
    //使用transform对星星进行缩放，使其大小和父视图一样
    CGFloat scale=self.size.height / 17;
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
