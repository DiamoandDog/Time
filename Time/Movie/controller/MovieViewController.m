//
//  MovieViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MovieViewController.h"
#import "MainTabBarViewController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"
#import "PostCollevtionView.h"
#import "IndexCollectionView.h"
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_rightButton;
    //
    PostCollevtionView *_postView;
    UITableView *_listView;
    NSMutableArray *_movieData;
    UIView *_headView; //头部视图所有视图的父视图
    UIImageView *_leftLight;
    UIImageView *_rightLight;
    UIView *_maskView;
    
    UIButton *_upDown;
    IndexCollectionView *_indexCollection;;
    
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"北美榜";
    //设置导航栏透明
    self.navigationController.navigationBar.translucent=YES;
    //读取json文件
    [self _loadData];
    //创建右上按钮
    [self _creatRightButton];
    //创建视图
    [self _creatViews];
    //创建头视图
    [self _creatHeadView];
    //添加观察者模式
    [_postView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    [_indexCollection addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    
}
#pragma mark - KVO 监控到属性发生改变
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    // 获取值
    NSInteger currentIndex = [change[@"new"] integerValue];
    // 滑动视图 显示这个单元格
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentIndex inSection:0];
    
    if (object == _postView && currentIndex != _indexCollection.currentIndex)
    {
        [_indexCollection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _indexCollection.currentIndex = currentIndex;
    }
    else if (object == _indexCollection && _postView.currentIndex != currentIndex)
    {
        [_postView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _postView.currentIndex = currentIndex;
    }
}

//
-(void)_loadData{
    //1.获取文件路劲
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    
    
    //2.读取文件
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    
    //3.解析文件
    NSError *error=[[NSError alloc]init];
   NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:data
                                    options:NSJSONReadingMutableLeaves
                                      error:&error];
    //数组初始化
    _movieData=[[NSMutableArray alloc]init];
    
    
    for(NSDictionary *d in dic[@"subjects"]){
        Movie *movie=[[Movie alloc]initWithDictionary:d];
        [_movieData addObject:movie];
    }
    
    //NSLog(@"%@",dic);
}


//创建右上角按钮
-(void)_creatRightButton{
    _rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame=CGRectMake(0, 0, 49, 25);
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateSelected];
    //点击时间
    [_rightButton addTarget:self action:@selector(rightButtonAc:) forControlEvents:UIControlEventTouchUpInside];
    
    //将button包装成导航项
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:_rightButton];
    //添加导航项
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
}

//设置按钮点击事件

-(void)rightButtonAc:(UIButton *)button{

   // button.selected=!button.selected;
    //根据选中状态 来设置旋转方向
    UIViewAnimationOptions option=button.selected ?UIViewAnimationOptionTransitionFlipFromRight :
        UIViewAnimationOptionTransitionFlipFromLeft;
    
    //给某个视图加动画
    [UIView transitionWithView:button  //需要添加动画的视图
                      duration:0.5     //动画持续时间
                       options:option  //翻转动作
                    animations:^{
                        button.selected=!button.selected;
                    }
                    completion:nil];
    
    [UIView transitionWithView:self.view  //需要添加动画的视图
                      duration:0.5     //动画持续时间
                       options:option  //翻转动作
                    animations:^{
                        _listView.hidden=!_listView.hidden;
                        _postView.hidden=!_postView.hidden;
                        _headView.hidden=!_headView.hidden;
                        
                    }
                    completion:nil];
}

//
-(void)_creatViews{
    //创建海报视图
    _postView=[[PostCollevtionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49) itemSize:CGSizeMake(kScreenWidth * 0.6, kScreenHeight * 0.6)];
    _postView.backgroundColor=[UIColor yellowColor];
    _postView.hidden=YES;
    _postView.data=_movieData;
    [self.view addSubview:_postView];
    
    //列表视图
    
    _listView=[[UITableView alloc]initWithFrame:_postView.frame style:UITableViewStylePlain];
    
    _listView.dataSource=self;
    _listView.delegate=self;
    _listView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_listView];
    _listView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    
    

}
//创建头部视图
-(void)_creatHeadView
{
    //创建遮罩视图
    _maskView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width * 10, self.view.size.height)];
    _maskView.backgroundColor=[UIColor blackColor];
    _maskView.alpha=0.4;
    _maskView.hidden=YES;
    [_postView addSubview:_maskView];
    //点击黑色视图，收起头部视图
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headViewMoveUp)];
    [_maskView addGestureRecognizer:tap];
    
    
    //手指乡下清华，下拉头部视图
    UISwipeGestureRecognizer *swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(headViewMoveDown)];
    //设置滑动方向
    swip.direction=UISwipeGestureRecognizerDirectionDown;
    [_postView addGestureRecognizer:swip];
    
    //创建父视图
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, -45, kScreenWidth, 130)];
    [self.view addSubview:_headView];
    
    _headView.backgroundColor=[UIColor clearColor];
    _headView.hidden=YES;
    
    //设置背景图片
    UIImageView *headImageView=[[UIImageView alloc]initWithFrame:_headView.bounds];
    UIImage *back=[UIImage imageNamed:@"indexBG_home"];
    //拉伸图片
    back=[back stretchableImageWithLeftCapWidth:0 topCapHeight:3];
    
    headImageView.image=back;
    [_headView addSubview:headImageView];

    
    
    
    
////////////////////////
    
    //上下移动的按钮
    _upDown=[UIButton buttonWithType:UIButtonTypeCustom];
    _upDown.frame=CGRectMake(0, 0, 26, 18);
    _upDown.center=CGPointMake(kScreenWidth / 2, 115);
    [_upDown setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_upDown setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [_headView addSubview:_upDown];
    
    [_upDown addTarget:self action:@selector(upDownAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建索引视图
    _indexCollection = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 110) itemSize:CGSizeMake(60, 90)];
    _indexCollection.data=_movieData;
    [_headView addSubview:_indexCollection];
    
    //灯
    UIImage *im=[UIImage imageNamed:@"light"];
    _leftLight=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-60, 0, 30, 120)];
    _leftLight.image=im;
    [_headView addSubview:_leftLight];
    _rightLight=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2+30, 0, 30, 120)];
    _rightLight.image=im;
    [_headView addSubview:_rightLight];
    
}
////////////////////////////////////////////////




//头部视图按钮事件
-(void)upDownAction:(UIButton *)button
{
    button.selected=!button.selected;
    
    if(button.selected){
        [self headViewMoveDown];
    }else{
        [self headViewMoveUp];
    }
}
//上移
-(void)headViewMoveUp{
    [UIView animateWithDuration:0.3 animations:^{
        _headView.top= -45;
        _rightLight.hidden=YES;
        _leftLight.hidden=YES;
        _maskView.hidden=YES;
        _upDown.selected=NO;
        
    }];
}
//下移
-(void)headViewMoveDown{
    [UIView animateWithDuration:0.3 animations:^{
        _headView.top=64;
        _rightLight.hidden=NO;
        _leftLight.hidden=NO;
        
        //
        _maskView.hidden=NO;
        _upDown.selected=YES;
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _movieData.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MtvieTableViewCell"];
    if(cell==nil){
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"MovieTableViewCell" owner:nil options:nil];
        
        cell=[array lastObject];
        
        cell.backgroundColor=[UIColor clearColor];
    }
    //
    cell.m=_movieData[indexPath.row];
    return cell;
}
//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
