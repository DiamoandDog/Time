//
//  TabBarButton.h
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIButton
/**
 *  初始化button
 *
 *  @param frame     位置大小
 *  @param imageName button的图片名
 *  @param title     标签的标题
 *
 *  @return 初始化完成后的button
 */
- (id)initWithFrame:(CGRect)frame
          imageName:(NSString *)imageName
              title:(NSString *)title;
@end
