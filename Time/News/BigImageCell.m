//
//  BigImageCell.m
//  Time
//
//  Created by imac on 15/8/10.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BigImageCell.h"
@interface BigImageCell() <UIScrollViewDelegate>
{
    UIImageView *_imageView;
    
    NSTimer *_timer;
}

@end@implementation BigImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self _createViews];
        
        [self _addTap];
    }
    
    return self;
}


- (void)_createViews
{
    // 创建滑动视图，以及图片视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [scrollView addSubview:_imageView];
    // 图片的拉伸模式
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 设置滑动视图的代理对象
    scrollView.delegate = self;
    
    // 设置放大缩小的倍数
    scrollView.minimumZoomScale = 0.3;
    scrollView.maximumZoomScale = 3;
    
    scrollView.tag = 888;
}

// 添加点击事件
- (void)_addTap
{
    // 点击的手势识别器
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    // 点击两次
    tap1.numberOfTapsRequired = 1;
    // 点击的手指数量
    tap1.numberOfTouchesRequired = 1;
    // 添加一个执行的方法
    [tap1 addTarget:self action:@selector(tapAction:)];
    
    [self addGestureRecognizer:tap1];
    
    
    // 点击的手势识别器
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] init];
    // 点击两次
    tap2.numberOfTapsRequired = 2;
    // 点击的手指数量
    tap2.numberOfTouchesRequired = 1;
    // 添加一个执行的方法
    [tap2 addTarget:self action:@selector(tapAction:)];
    
    [self addGestureRecognizer:tap2];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    if (tap.numberOfTapsRequired == 2)
    {
        // 如果触发双击 则停止单击的计时器
        [_timer invalidate];
        // 双击
        [self tapTwoAction];
    }
    else if (tap.numberOfTapsRequired == 1)
    {
        // 单击
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tapOneAction) userInfo:nil repeats:NO];
    }
    
}



// 单击事件
- (void)tapOneAction
{
    
    // 使用通知来隐藏导航栏
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kHiddenNavigationBar object:nil];
   // NSLog(@"单击");
    
}
// 双击事件
- (void)tapTwoAction
{
    // 判断当前缩放状态
    UIScrollView *scroll = (UIScrollView *)[self.contentView viewWithTag:888];
    CGFloat scale = scroll.zoomScale;
    if (scale > 2)
    {
        // 设置当前的缩放比例 还原到未缩放到状态
        [scroll setZoomScale:1 animated:YES];
        NSLog(@"fsf");
    }
    else
    {
        // 将图片放大
        [scroll setZoomScale:3 animated:YES];
        NSLog(@"sasasa");
    }
    
    
}
// 还原滑动视图的缩放比例
- (void)backScrollView
{
    UIScrollView *scroll = (UIScrollView *)[self.contentView viewWithTag:888];
    // 改变滑动视图的缩放比例
    [scroll setZoomScale:1 animated:NO];
}

/**
 *  单击双击的区分
 *
 *  1. 触发单击事件 使用一个定时器来判断  延迟0.5秒
 *  2. 如果 时间到了 但是没有触发双击事件，则执行单击的方法
 *  3. 如果触发了双击事件，那就取消定时
 */

// 设置缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}


- (void)setImageURL:(NSURL *)url
{
    [_imageView sd_setImageWithURL:url];
}
@end
