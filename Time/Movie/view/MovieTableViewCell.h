//
//  MovieTableViewCell.h
//  Time
//
//  Created by imac on 15/8/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "StarView.h"
@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;

@property(nonatomic,strong)Movie *m;
@property (weak, nonatomic) IBOutlet StarView *star;

@end
