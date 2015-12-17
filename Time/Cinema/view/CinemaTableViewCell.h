//
//  CinemaTableViewCell.h
//  Time
//
//  Created by imac on 15/8/13.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"
@interface CinemaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *quanImage;
@property (weak, nonatomic) IBOutlet UIImageView *qitaImage;
@property (weak, nonatomic) IBOutlet UILabel *farwayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *zuoImage;
@property (weak, nonatomic) IBOutlet UIImageView *tuanImage;
@property(nonatomic,strong)Cinema *cinema;
@end
