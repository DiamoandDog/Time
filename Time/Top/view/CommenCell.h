//
//  CommenCell.h
//  Time
//
//  Created by imac on 15/8/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
@interface CommenCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *ratLabel;
@property (weak, nonatomic) IBOutlet UILabel *talkLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong)Comment *com;
@end
