//
//  MainTabBarViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainTabBarViewController.h"
#import"TabBarButton.h"
@interface MainTabBarViewController ()
{
    UIImageView *_selectView;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置标签栏背景图片
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all@2x"]];
    //[self removeItem];
    self.tabBar.translucent=NO;
    [self creatItem];
}
-(void)viewDidAppear:(BOOL)animated{
    [self removeItem];
}

-(void)removeItem{
    Class buttonItem=NSClassFromString(@"UITabBarButton");
    for(UIView *subView in self.tabBar.subviews)
    {
        if([subView isMemberOfClass:buttonItem]){
            [subView removeFromSuperview];
            //subView.hidden=YES;
        }
    }
}

-(void)creatItem{
    //计算 按钮的大小
    // 创建按钮
    // 1. 计算按钮的长，宽
    CGFloat buttonWidth = kScreenWidth / self.viewControllers.count;
    CGFloat buttonHeight = 49;
    
    
    // 2. 循环创建按钮
    NSArray *imageNames = @[@"movie0",
                            @"movie1",
                            @"start_top250",
                            @"movie3",
                            @"movie4"];
    NSArray *titles = @[@"电影",
                        @"新闻",
                        @"Top250",
                        @"影院",
                        @"更多"];
    for (int i = 0; i < self.viewControllers.count; i++)
    {
        CGRect frame = CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHeight);
        TabBarButton *button=[[TabBarButton alloc]initWithFrame:frame imageName:imageNames[i] title:titles[i]];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAc:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
    }
    // 给图片视图 开启用户点击事件
  //  self.tabBar.userInteractionEnabled = YES;
    
    // 创建选中视图
    _selectView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
    _selectView.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    
    // 将这个选中视图 插入到按钮的下面
    [self.tabBar insertSubview:_selectView atIndex:0];
}
-(void)buttonAc:(UIButton *)button
{
    //获取按钮的tag
    NSUInteger tag=button.tag;
    //切换页面
    self.selectedIndex=tag;
    
    // 选中视图变化的动画效果
    [UIView animateWithDuration:0.3 animations:^{
        _selectView.center = button.center;
    }];
}



/**
 *  设置自定义的标签栏是否隐藏
 *
 *  @param hidden    是否隐藏
 *  @param animation 是否添加动画
 */
- (void)setTabBarHidden:(BOOL)hidden animation:(BOOL)animation
{
    if (animation)
    {
        // 隐藏动画
        [UIView animateWithDuration:0.3 animations:^{
            if (hidden)
            {
                self.tabBar.top = kScreenHeight;
            }
            else
            {
                self.tabBar.bottom = kScreenHeight;
            }
        }];
    }
    else
    {
        if (hidden)
        {
            self.tabBar.top = kScreenHeight;
        }
        else
        {
            self.tabBar.bottom = kScreenHeight;
        }
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
