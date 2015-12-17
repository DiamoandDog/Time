//
//  BaseCollectionView.h
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *data;//电影的数据
@property(nonatomic,assign)CGSize itemSize;//单元格大小
@property(nonatomic,assign)NSInteger currentIndex;//当前显示的是第几页


-(instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)itemSize;
@end
