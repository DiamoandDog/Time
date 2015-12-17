//
//  BigViewController.m
//  Time
//
//  Created by imac on 15/8/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BigViewController.h"
//#import "Images.h"
#import "BigImageCell.h"
@interface BigViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_bigCollecyion;
   // UICollectionViewCell *cell;
    
    BOOL  _hiddenNavigationBar;
}
@end

@implementation BigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title=@"图片浏览";
    self.view.backgroundColor=[UIColor blackColor];
    
    
    [self creatView];
    
    
    _hiddenNavigationBar = NO;
    //接受隐藏导航栏的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenNaviBar) name:kHiddenNavigationBar object:nil];
    
    
}
- (void)dealloc
{
    // 移除相应掉通知
    // 如果通知不移除，容易造成程序崩溃
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 



-(void)creatView{
    //创建布局对象
    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    //设置单元格大小
    flow.itemSize=CGSizeMake(kScreenWidth, kScreenHeight-64 );
    //设置单元格的水平间隙
    flow.minimumInteritemSpacing=10;
    flow.sectionInset=UIEdgeInsetsMake(0, 0, 0, 10);
    
    //设置滑动方向
    flow.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //创建collection
    _bigCollecyion = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth + 10, kScreenHeight) collectionViewLayout:flow];
    [self.view addSubview: _bigCollecyion];
    //
    _bigCollecyion.dataSource=self;
    _bigCollecyion.delegate=self;
    
    
    //注册单元格
    [_bigCollecyion registerClass:[BigImageCell class] forCellWithReuseIdentifier:@"imageCell"];
    //影藏滑块
    _bigCollecyion.showsHorizontalScrollIndicator=NO;
    //开启分页效果
    _bigCollecyion.pagingEnabled=YES;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageDataa.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BigImageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
//    //创建一个图片视图
    //UIImageView *imageView=[[UIImageView alloc]initWithFrame:cell.bounds];
    //如果显示的时第一个单元格
    NSURL *url;
    if(indexPath.row == 0){
    
        url=_imageDataa[_imageDataaa.row];
    }else{
    
        url=_imageDataa[indexPath.row];
    }
//    //加载网罗图片
    //[imageView sd_setImageWithURL:url];
    //设置图片的拉伸模式
   // imageView.contentMode=UIViewContentModeScaleAspectFit;
    
   // cell.backgroundView=imageView;
    [cell setImageURL:url];
    return cell;
    
}
//隐藏导航栏
-(void)hiddenNaviBar
{
    _hiddenNavigationBar = !_hiddenNavigationBar;
    // 根据当前导航栏的状态 来隐藏/显示导航栏
    [self.navigationController setNavigationBarHidden:_hiddenNavigationBar animated:YES];
    
    // 隐藏导航栏的同时 需要隐藏状态栏
    UIApplication *app = [UIApplication sharedApplication];
    [app setStatusBarHidden:_hiddenNavigationBar withAnimation:UIStatusBarAnimationSlide];
}


#pragma mark - 某个单元格滑出屏幕时调用
// 单元格已经结束显示
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    BigImageCell *big = (BigImageCell *)cell;
    // 将滑动视图缩放笔比例还原
    [big backScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    //滑动到点击的那个单元格，但是不加动画效果
    [_bigCollecyion scrollToItemAtIndexPath:_imageDataaa atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    //第一个单元格显示的图片，还原成第一张图；
    _imageDataaa=[NSIndexPath indexPathForRow:0 inSection:0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
