//
//  PostViewCell.h
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface PostViewCell : UICollectionViewCell
@property(nonatomic,strong)Movie *movie;
-(void)filpCell;
@end
