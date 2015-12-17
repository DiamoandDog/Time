//
//  FirstViewController.m
//  Time
//
//  Created by imac on 15/8/12.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scroll;
    UIImageView *_pageView;
    UIButton *_button;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏状态栏
    UIApplication *app=[UIApplication sharedApplication];
    [app setStatusBarHidden:YES];
    [self _createView];
}

-(void)_createView
{
    _scroll=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scroll.pagingEnabled=YES;
    _scroll.contentSize=CGSizeMake(5*kScreenWidth, 0);//[]
    _scroll.backgroundColor=[UIColor colorWithRed:0.1176 green:0.1176 blue:0.1372 alpha:1];
    _scroll.delegate=self;
    [self.view addSubview:_scroll];
    
    for(int i=0;i<5;i++){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        //
        NSString *imageName=[NSString stringWithFormat:@"guide%i",i+1];
        UIImage *im=[UIImage imageNamed:imageName];
        imageView.image=im;
        [_scroll addSubview:imageView];
    }
    _pageView=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-173)/2, kScreenHeight-50, 173, 26)];
    _pageView.image=[UIImage imageNamed:@"guideProgress1"];
    [self.view addSubview:_pageView];
    
    //
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [ _button setTitle:@"进入电影世界" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _button.frame=CGRectMake((kScreenWidth-200)/2, kScreenHeight-100, 200, 40);
    _button.hidden=YES;
    [_button addTarget:self action:@selector(showMainViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
}




//
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat x=scrollView.contentOffset.x;
    NSInteger index=(x+kScreenWidth/2)/kScreenWidth;
    NSArray *imageNames=@[@"guideProgress1",
                          @"guideProgress2",
                          @"guideProgress3",
                          @"guideProgress4",
                          @"guideProgress5"];
    UIImage *image=[UIImage imageNamed:imageNames[index]];
    _pageView.image=image;
    if(index==4){
        _button.hidden=NO;
        
    }else{
        _button.hidden=YES;
    }
}
-(void)showMainViewController{
    
    //显示状态栏
    UIApplication *app=[UIApplication sharedApplication];
    [app setStatusBarHidden:NO];
    //读取storyboard的第一个界面
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc=[story instantiateInitialViewController];
    //将这个视图控制器显示在window上
    self.view.window.rootViewController=vc;
    //视图显示的动画
    vc.view.transform=CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.5 animations:^{
        vc.view.transform=CGAffineTransformIdentity;
    }];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setBool:@YES forKey:@"first"];
    
    
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
