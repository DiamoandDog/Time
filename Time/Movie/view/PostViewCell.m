//
//  PostViewCell.m
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PostViewCell.h"
#import "StarView.h"
@interface PostViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *engLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratLabel;
@property (weak, nonatomic) IBOutlet StarView *starView;

@end

@implementation PostViewCell
-(void)setMovie:(Movie *)movie
{

    _movie=movie;
    _titleLabel.text=[NSString stringWithFormat:@"中文名：%@",_movie.titleCN];
    _titleLabel.numberOfLines=0;
    _engLabel.text=[NSString stringWithFormat:@"英文名：%@",_movie.titleEN];
    _engLabel.numberOfLines=0;
    _yearLabel.text=[NSString stringWithFormat:@"上映年份：%@",_movie.year];
    _yearLabel.numberOfLines=0;
    _ratLabel.text=[NSString stringWithFormat:@"%.1f",_movie.rating];
    NSURL *url=[NSURL URLWithString:_movie.images[MovieImageLargeKey]];
    [_detailImage sd_setImageWithURL:url];
    [_postImage sd_setImageWithURL:url];
    [_starView setRating:_movie.rating];
    _detailView.hidden=YES;
    
}
-(void)filpCell{
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _detailView.hidden = !_detailView.hidden;} completion:nil];
}
- (void)awakeFromNib {
    // Initialization code
}

@end
