//
//  CommenCell.m
//  Time
//
//  Created by imac on 15/8/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CommenCell.h"

@implementation CommenCell

-(void)setCom:(Comment *)com{

    _com=com;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:_com.userImage] ];
    _nameLabel.text=_com.nickname;
    
    //_ratLabel.text=[NSString stringWithFormat:@"%.1f",_com.rating];
    
    _talkLabel.text=_com.content;
    _talkLabel.numberOfLines=0;
    
    
    if (com.rating == nil || com.rating.length == 0)
    {
        _ratLabel.text = @"0.0";
    }
    else
    {
        _ratLabel.text = _com.rating;
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
