//
//  TopCollectionViewCell.h
//  Time
//
//  Created by imac on 15/8/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Top.h"
#import "StarView2.h"
@interface TopCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleRat;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet StarView2 *starView;
@property(nonatomic,strong)Top *top;
@end
