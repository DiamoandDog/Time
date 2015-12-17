//
//  NewsTableViewCell.m
//  Time
//
//  Created by imac on 15/8/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "NewsTableViewCell.h"
@interface NewsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end
@implementation NewsTableViewCell


- (void)setNews:(News *)news
{
    [_newsImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
    //根据type 来设置不同的图片
    NSInteger type = [news.type integerValue];
    UIImage *image;
    if (type == 1)
    {
        image = [UIImage imageNamed:@"sctpxw"];
    }
    else if (type == 2)
    {
        image = [UIImage imageNamed:@"scspxw"];
    }
    else
    {
        image = nil;
    }
    _typeImageView.image = image;
    
    _titleLabel.text = news.title;
    _summaryLabel.text = news.summary;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
