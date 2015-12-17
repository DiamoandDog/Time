//
//  LaunchViewController.m
//  Time
//
//  Created by imac on 15/8/12.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createImageViews];
    
    //
    [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(showImageView:) userInfo:nil repeats:YES];
}

-(void)showImageView:(NSTimer *)timer{
    static int tag=1;
    UIView *imageView=[self.view viewWithTag:tag];
    [UIView animateWithDuration:0.1 animations:^{
        imageView.hidden=NO;
        
    }];
    tag++;
    if(tag==25){
        //停止计时器
        [timer invalidate];
        //显示应用程序的第一个界面
        [self performSelector:@selector(showMainViewController) withObject:nil afterDelay:0.2];
        
    }
}

-(void)showMainViewController{
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
    
}


-(void)_createImageViews
{

    //
    CGFloat imageWidth=kScreenWidth / 4;
    CGFloat imageHeight=kScreenHeight / 6;
    NSInteger x=0;
    NSInteger y=0;
    NSInteger z=1;
    for(y=0;x<4;x++){
    
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //最后一列
    y=1;
    x=3;
    for(;y<6;y++){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //最下面一行
    y=5;
    x=2;
    for(;x>=0;x--){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //第一列
    x=0;
    y=4;
    for(;y>0;y--){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //
    x=1;
    y=1;
    for(;x<3;x++){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //
    x=2;
    y=2;
    for(;y<5;y++){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
    //
    x=1;
    y=4;
    for(;y>1;y--){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x * imageWidth, y * imageHeight, imageWidth, imageHeight)];
        [self.view addSubview:imageView];
        imageView.tag=z;
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",z]];
        z++;
        imageView.hidden=YES;
    }
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
