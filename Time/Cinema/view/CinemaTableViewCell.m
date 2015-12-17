//
//  CinemaTableViewCell.m
//  Time
//
//  Created by imac on 15/8/13.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell



-(void)setCinema:(Cinema *)cinema{
    _cinema=cinema;
    _nameLabel.text=_cinema.name;
    _adressLabel.text=_cinema.address;
    _ratLabel.text=_cinema.grade;
    _pressLabel.text=_cinema.lowPrice;
    NSLog(@"%@",_pressLabel);
    
    _farwayLabel.text=_cinema.distance;
    
    NSInteger isSeatSupport=[_cinema.isSeatSupport integerValue];
    UIImage *image;
    if(isSeatSupport==1){
        image=[UIImage imageNamed:@"cinemaSeatMark@2x"];
    }else if(isSeatSupport==0){
        image=nil;
    }
    _zuoImage.image=image;
    NSInteger isCouponSupport=[_cinema.isCouponSupport integerValue];
    UIImage *image1;
    if(isCouponSupport==1){
    
        image1=[UIImage imageNamed:@"cinemaCouponMark@2x"];
    }else if(isCouponSupport==0){
        image1=nil;
    }
    _quanImage.image=image1;
    NSInteger  isGroupBuySupport=[_cinema.isGroupBuySupport integerValue];
    UIImage *image2;
    if(isGroupBuySupport==1){
        image2=[UIImage imageNamed:@"cinemaGrouponMark@2x"];
    }else if(isGroupBuySupport==0){
        image2=nil;
    }
    _tuanImage.image=image2;
    
    NSInteger isImaxSupport=[_cinema.isImaxSupport integerValue];
    UIImage *image3;
    if(isImaxSupport==1){
        image3=[UIImage imageNamed:@"imaxMark@2x"];
    }else if (isImaxSupport==0){
        image3=nil;
    }
    _qitaImage.image=image3;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
