//
//  BaseViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

{
    UILabel *_titleLabel;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航栏 title
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 170, 40)];
    _titleLabel.text=@"ad";
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.font=[UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView=_titleLabel;
    

}
//title设置方法
-(void)setTitle:(NSString *)title{
    [super setTitle:title];
    _titleLabel.text=title;
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
