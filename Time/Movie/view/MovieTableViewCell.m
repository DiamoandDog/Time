//
//  MovieTableViewCell.m
//  Time
//
//  Created by imac on 15/8/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MovieTableViewCell.h"
@implementation MovieTableViewCell
//在导入数据的同时，根据数据内容，填充至控件中
-(void)setM:(Movie *)movie{
    _m=movie;
    _label1.text=_m.titleCN;
    _label2.text=[NSString stringWithFormat:@"上映年份：%@",_m.year];
    _label3.text=[NSString stringWithFormat:@"%.1f",_m.rating];
    //电影图片;
    //从Movie中取出samll 的图片地址，并转化为URL对象
    NSURL *url=[NSURL URLWithString:_m.images[MovieImageSmallKey]];
    [_imageview1 sd_setImageWithURL:url];
    
    //星星
    [_star setRating:_m.rating];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
