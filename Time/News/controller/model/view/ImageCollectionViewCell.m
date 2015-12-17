//
//  ImageCollectionViewCell.m
//  Time
//
//  Created by imac on 15/8/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ImageCollectionViewCell.h"
@interface ImageCollectionViewCell()


@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@end
@implementation ImageCollectionViewCell
-(void)setImagee:(Images *)imagee{
    [_myImage sd_setImageWithURL:[NSURL URLWithString:imagee.image]];
}
@end
