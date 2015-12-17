//
//  PostCollevtionView.m
//  Time
//
//  Created by imac on 15/8/10.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "PostCollevtionView.h"
#import "PostViewCell.h"
@interface PostCollevtionView()
//
//{
//   NSMutableArray  *data;    // 电影的数据
//}
@end
@implementation PostCollevtionView


- (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)itemSize
{
    self = [super initWithFrame:frame itemSize:itemSize];
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"PostViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellWithReuseIdentifier:@"PostCell"];
    }
    
    return self;
}


#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
    
    cell.movie = self.data[indexPath.item];
    
    return cell;
}



// 点击单元格  滑动/翻转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断点击的是那个单元格
    // 1.根据偏移量 计算当前显示在最中间的单元格
    NSInteger index = collectionView.contentOffset.x / (collectionView.width * 0.6 + 10);
    // 2.和被点中的单元格indexPath做比较
    if (index == indexPath.item)
    {
        // 点击的是正中间的单元格  做翻转
        // 获取中间这个单元格
        PostViewCell *cell = (PostViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        // 翻转
        [cell filpCell];
    }
    else
    {
        // 点击的是两边的单元格   滑动到中间
        [collectionView scrollToItemAtIndexPath:indexPath
                               atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                       animated:YES];
        
        self.currentIndex = indexPath.item;
    }
}

//
//
//-(instancetype)initWithFrame:(CGRect)frame
//{
//    //创建布局对象
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
//    //单元格大小
//    layout.itemSize = CGSizeMake(frame.size.width*0.6, frame.size.height*0.6);
//    //单元格间隙
//    layout.minimumInteritemSpacing = 10;
//    layout.minimumLineSpacing = 10;
//    layout.sectionInset=UIEdgeInsetsMake(10, frame.size.width * 0.2, 10, frame.size.width * 0.2);
//    //设置滑动方向
//    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
//    [self _loadData];
//    self=[super initWithFrame:frame collectionViewLayout:layout];
//    if(self){
//    
//        self.delegate=self;
//        self.dataSource=self;
//        //分页显示
//        
//        //注册单元格
//        UINib *nib=[UINib nibWithNibName:@"PostViewCell" bundle:[NSBundle mainBundle]];
//        [self registerNib:nib forCellWithReuseIdentifier :@"PostCell"];
//        
//    }
//    return self;
//}
////滑动将要停止时调用
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView
//                    withVelocity:(CGPoint)velocity
//             targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    //分页显示
//    //使用结构体指针去访问结构体的成员变量，要使用 "->"
//    CGFloat offset=targetContentOffset->x;
//    //计算滑动完成之后，落在哪一个单元格内
//    // 0-0.5 + 间隙宽度  indexPath.item=0;
//    //0.5-1.5+2*间隙 indexPath。item=1；
//    
//    offset+=scrollView.width * 0.6 /2;
//    NSInteger index=offset/(scrollView.width*0.6 +10);
//    
//    //计算分页后的偏移量
//    offset=index*(scrollView.width*0.6 +10);
//    
//    //改变滑动结束之后的偏移量
//    targetContentOffset->x=offset;
//    
//}
//-(void)_loadData{
//    //1.获取文件路劲
//    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
//    
//    
//    //2.读取文件
//    NSData *dat=[NSData dataWithContentsOfFile:filePath];
//    
//    
//    //3.解析文件
//    NSError *error=[[NSError alloc]init];
//    NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:dat
//                                                       options:NSJSONReadingMutableLeaves
//                                                         error:&error];
//    //数组初始化
//    data=[[NSMutableArray alloc]init];
//    
//    
//    for(NSDictionary *d in dic[@"subjects"]){
//        Movie *movie=[[Movie alloc]initWithDictionary:d];
//        [data addObject:movie];
//    }
//    
//    //NSLog(@"%@",dic);
//}
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    //判断点击的是哪个单元格
//    //1.根据偏移量 计算当前显示在最中间的单元格
//    
//    NSInteger index=collectionView.contentOffset.x / (collectionView.width*0.6 +10);
//    
//    //2.和被点中的单元格indexPath作比较
//    if(index==indexPath.item){
//            //
//        //获取当前cell
//        PostViewCell *cell=(PostViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        //翻转cell
//        [cell filpCell];
//    
//    }else{
//        [collectionView scrollToItemAtIndexPath:indexPath
//                               atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
//                                       animated:YES];
//        self.currentIndex=indexPath.item;
//    }
//    
//}
//
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 10;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    PostViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
//    cell.backgroundColor=[UIColor grayColor];
//    cell.movie=data[indexPath.item];
//    return  cell;
//}

@end
