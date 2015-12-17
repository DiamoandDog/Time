//
//  BaseCollectionView.m
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                    withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获取系统的滑动结束后的偏移量
    CGFloat offset=targetContentOffset->x;
    //计算滑动完成之后，落在哪一个单元格内
    offset += _itemSize.width / 2;
    NSInteger index = offset / (_itemSize.width + 10);
    //计算分页后的偏移量
    offset = index * (_itemSize.width + 10);
    //改变滑动结束之后的偏移量
    targetContentOffset->x=offset;
    
    //记录当前的页码索引
    self.currentIndex=index;
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}



- (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)itemSize
{
    // 创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 单元格大小
    layout.itemSize = itemSize;
    _itemSize = itemSize;
    // 单元格间隙
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    CGFloat leftWidth = (frame.size.width - _itemSize.width) / 2;
    layout.sectionInset = UIEdgeInsetsMake(10, leftWidth, 10, leftWidth);
    
    // 滑动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 初始化视图
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        // 分页显示
        //        self.pagingEnabled = YES;
        
        // 注册单元格
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        // 当前页码初始化
        _currentIndex = 0;
    }
    // 返回
    return self;
    
}@end
