//
//  TopCollectionViewCell.m
//  Time
//
//  Created by imac on 15/8/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TopCollectionViewCell.h"


@interface TopCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *myImage;


@end

@implementation TopCollectionViewCell

-(void)setTop:(Top *)top{
    
    //[_myImage sd_setImageWithURL:[NSURL URLWithString:top.image ]];
    
    
    _top=top;
    _titleName.text=_top.title;
   _titleRat.text=[NSString stringWithFormat:@"%.1f",_top.rating];
    //电影图片
    //从Movie中取出samll 的图片地址，并转化为URL对象
    NSURL *url=[NSURL URLWithString:_top.image[TopImageSmallKey]];
    [_myImage sd_setImageWithURL:url];
    
    //星星
    [_starView _creatViews];
    [_starView setRating:_top.rating];
    
}

@end
