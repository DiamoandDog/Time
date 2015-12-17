//
//  BigImageCell.h
//  Time
//
//  Created by imac on 15/8/10.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UICollectionViewCell
- (void)setImageURL:(NSURL *)url;



// 还原滑动视图的缩放比例
- (void)backScrollView;
@end
