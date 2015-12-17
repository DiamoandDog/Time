//
//  MainTabBarViewController.h
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarViewController : UITabBarController


/**
 *  设置自定义的标签栏是否隐藏
 *
 *  @param hidden    是否隐藏
 *  @param animation 是否添加动画
 */
- (void)setTabBarHidden:(BOOL)hidden animation:(BOOL)animation;
@end
