//
//  UIButton+Helpers.h
//  
//
//  Created by lixiangdong on 16/3/23.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(Attribute)

/**
 * 设置按钮文字颜色
 */
- (void)setBtnTitleColor:(UIColor*)normalColor pressColor:(UIColor*)preColor;

/**
 * 设置按钮背景色和按压时背景色
 * @param norColor -- 正常状态颜色
 * @param preColor -- 点击时背景色
 */
- (void)setBtnBackgroundColor:(UIColor*)normalColor pressColor:(UIColor*)preColor;

/**
 * 设置蓝色通用按钮（正常时背景为蓝色，点击时背景色为深蓝色，正常和点击文字都为白色）
 */
//- (void)setBtnColor;


/**
 * 去掉背景色
 */
//- (void)setBtnClearColor;

@end
