//
//  IndexCollectionView.m
//  Time
//
//  Created by imac on 15/8/11.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "IndexCollectionView.h"
#import "Movie.h"
@implementation IndexCollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if(cell.backgroundView==nil){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:cell.bounds];
        cell.backgroundView=imageView;
    }
    Movie *movie=self.data[indexPath.item];
    UIImageView *image=(UIImageView *)cell.backgroundView;
    [image sd_setImageWithURL:[NSURL URLWithString:movie.images[MovieImageSmallKey]]];
    return cell;
}


// 点击单元格  滑动
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 点击的是两边的单元格   滑动到中间
    [collectionView scrollToItemAtIndexPath:indexPath
                           atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                   animated:YES];
    self.currentIndex = indexPath.item;
}





















@end
