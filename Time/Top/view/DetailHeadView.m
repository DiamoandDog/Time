//
//  DetailHeadView.m
//  Time
//
//  Created by imac on 15/8/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailHeadView.h"
@interface DetailHeadView()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *daoyanLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *leiLabel;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UIScrollView *vedioScroll;
@end
@implementation DetailHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//    CGRect imageWidth=
//    UIImageView *imageView=[UIImageView alloc]initWithFrame:CGRectMake(3 + (imageWidth + 3)*i, 3, ima, /)

- (void)setDetail:(NSDictionary *)detail
{
    //_detail = [detail copy];
    _detail=detail;
    // 电影图片
    [_myImage sd_setImageWithURL:[NSURL URLWithString:_detail[@"image"]]];
    // label
    _titleLabel.text = detail[@"titleCn"];
    NSArray *array = detail[@"directors"];
    _daoyanLabel.text = [NSString stringWithFormat:@"导演:%@", [array componentsJoinedByString:@","]];
    
    array = detail[@"actors"];
    _actorLabel.text = [NSString stringWithFormat:@"演员:%@", [array componentsJoinedByString:@","]];
    
    array = detail[@"type"];
    _leiLabel.text = [NSString stringWithFormat:@"类型:%@", [array componentsJoinedByString:@","]];
    
    _year.text = [NSString stringWithFormat:@"上映年份:%@", detail[@"year"]];
    
    [self _createScrollView:detail[@"images"]];
}

- (void)_createScrollView:(NSArray *)array
{
    
    CGFloat imageWidth = _vedioScroll.height - 6;
    // 创建滑动视图的内容视图
    for (int i = 0; i < array.count; i++)
    {
        // 创建图片视图
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(3 + (imageWidth + 3) * i, 3, imageWidth, imageWidth)];
        // 从网络读取图片
        NSURL *url = [NSURL URLWithString:array[i]];
        [imageView sd_setImageWithURL:url];
        // 将图片添加到滑动视图上去
        [_vedioScroll addSubview:imageView];
        
        
        imageView.layer.borderColor = [[UIColor yellowColor] CGColor];
        imageView.layer.borderWidth = 1;
        imageView.layer.cornerRadius = 20;
        
        imageView.layer.masksToBounds = YES;
    }
    // 设定滑动视图的滑动范围
    _vedioScroll.contentSize = CGSizeMake(3 + (imageWidth + 3) * array.count, 0);
    
    
    // 设置边框和圆角
    _vedioScroll.layer.borderColor = [[UIColor redColor] CGColor];
    _vedioScroll.layer.borderWidth = 2;
    _vedioScroll.layer.cornerRadius = 5;
    
}


@end
